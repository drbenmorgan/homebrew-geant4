class G4saiddata < Formula
  desc "Geant4 data library for SAID evaluated cross-sections"
  homepage "https://geant4.cern.ch"
  url "https://geant4-data.web.cern.ch/geant4-data/datasets/G4SAIDDATA.2.0.tar.gz"
  sha256 "1d26a8e79baa71e44d5759b9f55a67e8b7ede31751316a9e9037d80090c72e91"
  license ""
  revision 1

  bottle do
    root_url "https://ghcr.io/v2/drbenmorgan/geant4"
    sha256 cellar: :any_skip_relocation, all: "df7ef6204a69414ccc6f8967981279b3253c2f04e06ac3e9258f3522bc2f85cc"
  end

  def install
    (pkgshare/buildpath.basename.to_s).install Dir["./*"]
  end

  test do
    assert_predicate pkgshare, :exist?
  end
end
