class G4realsurface < Formula
  desc "Geant4 data library for measured optical surface reflectance"
  homepage "https://geant4.cern.ch"
  url "https://geant4-data.web.cern.ch/geant4-data/datasets/G4RealSurface.2.2.tar.gz"
  sha256 "9954dee0012f5331267f783690e912e72db5bf52ea9babecd12ea22282176820"
  license ""

  def install
    (pkgshare/buildpath.basename.to_s).install Dir["./*"]
  end

  test do
    assert_predicate pkgshare, :exist?
  end
end
