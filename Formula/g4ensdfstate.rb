class G4ensdfstate < Formula
  desc "Geant4 data library for nuclide properties"
  homepage "https://geant4.web.cern.ch"
  url "https://geant4-data.web.cern.ch/geant4-data/datasets/G4ENSDFSTATE.2.3.tar.gz"
  sha256 "9444c5e0820791abd3ccaace105b0e47790fadce286e11149834e79c4a8e9203"
  license ""
  revision 4

  bottle do
    root_url "https://ghcr.io/v2/drbenmorgan/geant4"
    sha256 cellar: :any_skip_relocation, all: "abfcbff02fc0c87d36d56440b7bd309f03fb2e1296f91d14a053ef6dbe74326e"
  end

  def install
    (pkgshare/buildpath.basename.to_s).install Dir["./*"]
  end

  test do
    assert_predicate pkgshare, :exist?
  end
end
