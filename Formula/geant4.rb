class Geant4 < Formula
  desc "Toolkit for simulating the passage of particles through matter"
  homepage "https://geant4.cern.ch"
  url "https://github.com/Geant4/geant4/archive/refs/tags/v11.0.2.tar.gz"
  sha256 "ddabe8d5cc3bd465c969f375cc43ee537ff33c17dc2943b8a4420cfa83cfcfcc"
  license "NOASSERTION"

  depends_on "cmake" => :build
  depends_on "xerces-c"

  uses_from_macos "expat"
  uses_from_macos "zlib"

  def install
    args = std_cmake_args + %w[
      -DGEANT4_BUILD_TLS_MODEL=global-dynamic
      -DGEANT4_INSTALL_DATADIR=/usr/local/opt/geant4-data
      -DGEANT4_USE_GDML=ON
      -DGEANT4_USE_SYSTEM_EXPAT=ON
      -DGEANT4_USE_SYSTEM_ZLIB=ON
      -DGEANT4_INSTALL_PACKAGE_CACHE=OFF
    ]
    system "cmake", "-S", ".", "-B", "build", *args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"

    # Adjust package cache for qt@5 because it is keg-only
    # Becomes redundant once we support qt6
    # cannot install default because it will store SDK paths which will
    # conflict either with the test stage or use of the install formula
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
    system "cmake", "-DCMAKE_VERBOSE_MAKEFILE=ON", example_path.to_s
    system "make"
    system "./run.sh"
  end
end
