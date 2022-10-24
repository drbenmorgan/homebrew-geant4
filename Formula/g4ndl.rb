class G4ndl < Formula
  desc "Geant4 data library for neutron cross sections"
  homepage "https://geant4.cern.ch"
  url "https://geant4-data.web.cern.ch/geant4-data/datasets/G4NDL.4.6.tar.gz"
  sha256 "9d287cf2ae0fb887a2adce801ee74fb9be21b0d166dab49bcbee9408a5145408"
  license ""
  revision 1

  def install
    (pkgshare/buildpath.basename.to_s).install Dir["./*"]
  end

  test do
    assert_predicate pkgshare, :exist?
  end
end
