class G4abla < Formula
  desc "Geant4 data library for nuclear shell effects in INCL/ABLA models"
  homepage "https://geant4.cern.ch"
  url "https://geant4-data.web.cern.ch/geant4-data/datasets/G4ABLA.3.1.tar.gz"
  sha256 "7698b052b58bf1b9886beacdbd6af607adc1e099fc730ab6b21cf7f090c027ed"
  license ""

  def install
    (pkgshare/buildpath.basename.to_s).install Dir["./*"]
  end

  test do
    assert_predicate pkgshare, :exist?
  end
end
