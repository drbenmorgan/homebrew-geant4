class G4ensdfstate < Formula
  desc "Geant4 data library for nuclide properties"
  homepage "https://geant4.web.cern.ch"
  url "https://geant4-data.web.cern.ch/geant4-data/datasets/G4ENSDFSTATE.2.3.tar.gz"
  sha256 "9444c5e0820791abd3ccaace105b0e47790fadce286e11149834e79c4a8e9203"
  license ""
  revision 1

  bottle do
    root_url "https://ghcr.io/v2/drbenmorgan/geant4"
    rebuild 1
    sha256 cellar: :any_skip_relocation, monterey:     "4da9667d2f91ce11377bbe68ad652c7c6f37b9e9c49ecde2a6ef7d50b3573af3"
    sha256 cellar: :any_skip_relocation, big_sur:      "ef779219b2e52c06e92ec3d6885c6e7bd44c5c44dd08d81dd6e9fa9dce061052"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "149254f26e243dffc99ca8d6cc31489682b987e93ff32eca69ebd380edc9211a"
  end

  def install
    pkgshare.install Dir["*"]
  end

  test do
    assert_predicate pkgshare, :exist?
  end
end
