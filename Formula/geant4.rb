class Geant4 < Formula
  desc "Toolkit for simulating the passage of particles through matter"
  homepage "https://geant4.web.cern.ch"
  url "https://github.com/Geant4/geant4/archive/refs/tags/v11.0.2.tar.gz"
  sha256 "ddabe8d5cc3bd465c969f375cc43ee537ff33c17dc2943b8a4420cfa83cfcfcc"
  license ""

  depends_on "cmake" => [:build, :test]
  depends_on "geant4-data"
  depends_on "qt@5"
  depends_on "xerces-c"

  uses_from_macos "expat"
  uses_from_macos "zlib"

  def install
    args = std_cmake_args + %W[
      -DGEANT4_BUILD_MULTITHREADED=ON
      -DGEANT4_BUILD_TLS_MODEL=global-dynamic
      -DGEANT4_BUILD_BUILTIN_BACKTRACE=OFF
      -DGEANT4_INSTALL_DATADIR=#{Formula["geant4-data"].opt_pkgshare}
      -DGEANT4_USE_GDML=ON
      -DGEANT4_USE_QT=ON
      -DGEANT4_USE_SYSTEM_EXPAT=ON
      -DGEANT4_USE_SYSTEM_ZLIB=ON
      -DGEANT4_INSTALL_PACKAGE_CACHE=OFF
    ]
    system "cmake", "-S", ".", "-B", "build", *args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"

    # Adjust package cache for qt@5 because it is keg-only
    # Becomes redundant once we support qt6
    # Cannot install default because it will store SDK paths which will
    # conflict either with the test stage or use of the installed formula
    # It also hardcodes paths which we don't want
    (buildpath/"cache.cmake").write <<~EOS
      list(PREPEND CMAKE_PREFIX_PATH "${CMAKE_CURRENT_LIST_DIR}/qt@5")
    EOS
    (lib/"Geant4-#{version}").install_symlink Formula["qt@5"].opt_prefix
    (lib/"Geant4-#{version}").install buildpath/"cache.cmake" => "Geant4PackageCache.cmake"
  end

  def caveats
    <<~EOS
      As of Geant4 11.0, you need to source the `geant4` scripts in order
      to set environment variables needed by the toolkit to locate physics
      data libraries. These can be set through:

      For bash users:
        . #{HOMEBREW_PREFIX}/bin/geant4.sh
      For zsh users:
        pushd #{HOMEBREW_PREFIX} >/dev/null; . bin/geant4.sh; popd >/dev/null
      For csh/tcsh users:
        source #{HOMEBREW_PREFIX}/bin/geant4.csh
    EOS
  end

  test do
    example_path = share/"Geant4-#{version}/examples/basic/B1"

    (testpath/"run.sh").write <<~EOS
      #!/bin/sh
      source #{prefix}/bin/geant4.sh
      ./exampleB1 exampleB1.in
    EOS
    chmod 0755, testpath/"run.sh"

    # CPATH (and possibly other variables set by Homebrew) can interfere
    # with CMake's find_package mechanism and subsequent build, so delete it.
    ENV.delete "CPATH"
    system "cmake",
           "-DCMAKE_PREFIX_PATH=#{Formula["qt@5"].opt_prefix}",
           "-DCMAKE_VERBOSE_MAKEFILE=ON",
           example_path.to_s
    system "make"
    system "./run.sh"
  end
end
