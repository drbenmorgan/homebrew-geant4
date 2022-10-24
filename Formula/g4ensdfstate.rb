class G4ensdfstate < Formula
  desc "Geant4 data library for nuclide properties"
  homepage "https://geant4.web.cern.ch"
  url "https://geant4-data.web.cern.ch/geant4-data/datasets/G4ENSDFSTATE.2.3.tar.gz"
  sha256 "9444c5e0820791abd3ccaace105b0e47790fadce286e11149834e79c4a8e9203"
  license ""
  revision 3

  bottle do
    root_url "https://ghcr.io/v2/drbenmorgan/geant4"
    sha256 cellar: :any_skip_relocation, monterey:     "7bfb3d5d66f6f7be7f1363cf798bd33367c19355554fb690aa89d01b3f0ea70d"
    sha256 cellar: :any_skip_relocation, big_sur:      "7bfb3d5d66f6f7be7f1363cf798bd33367c19355554fb690aa89d01b3f0ea70d"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "fc3cf948b7701b1f98daa4a056a041fcc30025cb9abf505294d601b6ca169479"
  end

  def install
    (pkgshare/buildpath.basename.to_s).install Dir["./*"]
  end

  test do
    assert_predicate pkgshare, :exist?
  end
end
