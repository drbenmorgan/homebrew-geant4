class G4photonevaporation < Formula
  desc "Geant4 data library for photon evaporation"
  homepage "https://geant4.cern.ch"
  url "https://geant4-data.web.cern.ch/geant4-data/datasets/G4PhotonEvaporation.5.7.tar.gz"
  sha256 "761e42e56ffdde3d9839f9f9d8102607c6b4c0329151ee518206f4ee9e77e7e5"
  license ""
  revision 1

  bottle do
    root_url "https://ghcr.io/v2/drbenmorgan/geant4"
    sha256 cellar: :any_skip_relocation, all: "8726b1acad188ecccfbaac0be5ce259c635572df34f0e13fbceecab58cd76839"
  end

  def install
    (pkgshare/buildpath.basename.to_s).install Dir["./*"]
  end

  test do
    assert_predicate pkgshare, :exist?
  end
end
