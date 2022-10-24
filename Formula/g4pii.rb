class G4pii < Formula
  desc "Geant4 data library for shell ionisation cross-sections"
  homepage "https://geant4.cern.ch"
  url "https://geant4-data.web.cern.ch/geant4-data/datasets/G4PII.1.3.tar.gz"
  sha256 "6225ad902675f4381c98c6ba25fc5a06ce87549aa979634d3d03491d6616e926"
  license ""
  revision 1

  bottle do
    root_url "https://ghcr.io/v2/drbenmorgan/geant4"
    sha256 cellar: :any_skip_relocation, all: "7ccabdab26235f90aff5a18f9a1dded32cf1563766a7c64334ef1f3359b33e24"
  end

  def install
    (pkgshare/buildpath.basename.to_s).install Dir["./*"]
  end

  test do
    assert_predicate pkgshare, :exist?
  end
end
