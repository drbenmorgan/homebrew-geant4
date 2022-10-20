class G4ensdfstate < Formula
  desc "Geant4 data library for nuclide properties"
  homepage "https://geant4.web.cern.ch"
  url "https://geant4-data.web.cern.ch/geant4-data/datasets/G4ENSDFSTATE.2.3.tar.gz"
  sha256 "9444c5e0820791abd3ccaace105b0e47790fadce286e11149834e79c4a8e9203"
  license ""
  revision 2

  bottle do
    root_url "https://ghcr.io/v2/drbenmorgan/geant4"
    sha256 cellar: :any_skip_relocation, monterey:     "0ec47bb46b5c05fd30c14db332e053b2337ea21b84cefab41c4c46b18c0b9883"
    sha256 cellar: :any_skip_relocation, big_sur:      "7d22dbb54d3d8109f40eccad151f0147687319f1a781dd67d765a3d49a952271"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "be337b7fa562fe730bf7fac80d4ac95ad588cdf83746c97533bac67d306eaa7b"
  end

  def install
    (pkgshare/buildpath.basename.to_s).install Dir["./*"]
  end

  test do
    assert_predicate pkgshare, :exist?
  end
end
