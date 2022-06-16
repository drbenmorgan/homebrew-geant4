class G4particlexs < Formula
  desc "Geant4 data library for evaluated particle cross-sections on natural elements"
  homepage "https://geant4.cern.ch"
  url "https://geant4-data.web.cern.ch/geant4-data/datasets/G4PARTICLEXS.4.0.tar.gz"
  sha256 "9381039703c3f2b0fd36ab4999362a2c8b4ff9080c322f90b4e319281133ca95"
  license ""

  def install
    (pkgshare/buildpath.basename.to_s).install Dir["./*"]
  end

  test do
    assert_predicate pkgshare, :exist?
  end
end
