class G4emlow < Formula
  desc "Geant4 data library for low energy electromagneticprocesses"
  homepage "https://geant4.cern.ch"
  url "https://geant4-data.web.cern.ch/geant4-data/datasets/G4EMLOW.8.0.tar.gz"
  sha256 "d919a8e5838688257b9248a613910eb2a7633059e030c8b50c0a2c2ad9fd2b3b"
  license ""
  revision 1

  bottle do
    root_url "https://ghcr.io/v2/drbenmorgan/geant4"
    sha256 cellar: :any_skip_relocation, all: "e85d2fb28048a4d79bbd6ffac6815fa8798f539b3501b3301570a03a2affcd2c"
  end

  def install
    (pkgshare/buildpath.basename.to_s).install Dir["./*"]
  end

  test do
    assert_predicate pkgshare, :exist?
  end
end
