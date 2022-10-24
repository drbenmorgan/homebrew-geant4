class G4particlexs < Formula
  desc "Geant4 data library for evaluated particle cross-sections on natural elements"
  homepage "https://geant4.cern.ch"
  url "https://geant4-data.web.cern.ch/geant4-data/datasets/G4PARTICLEXS.4.0.tar.gz"
  sha256 "9381039703c3f2b0fd36ab4999362a2c8b4ff9080c322f90b4e319281133ca95"
  license ""
  revision 1

  bottle do
    root_url "https://ghcr.io/v2/drbenmorgan/geant4"
    sha256 cellar: :any_skip_relocation, all: "1fc3f88a5b1abf421a3d039d8b6342587e722e0ab488bfaf546377678ce79151"
  end

  def install
    (pkgshare/buildpath.basename.to_s).install Dir["./*"]
  end

  test do
    assert_predicate pkgshare, :exist?
  end
end
