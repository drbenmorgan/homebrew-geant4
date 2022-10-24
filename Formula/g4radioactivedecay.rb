class G4radioactivedecay < Formula
  desc "Geant4 data library for radioactive decay hadronic processes"
  homepage "https://geant4.cern.ch"
  url "https://geant4-data.web.cern.ch/geant4-data/datasets/G4RadioactiveDecay.5.6.tar.gz"
  sha256 "3886077c9c8e5a98783e6718e1c32567899eeb2dbb33e402d4476bc2fe4f0df1"
  license ""
  revision 1

  bottle do
    root_url "https://ghcr.io/v2/drbenmorgan/geant4"
    sha256 cellar: :any_skip_relocation, all: "e98696e487ca5951026cf50e5dea2454e420afc830048484fe8a9b238b98a391"
  end

  def install
    (pkgshare/buildpath.basename.to_s).install Dir["./*"]
  end

  test do
    assert_predicate pkgshare, :exist?
  end
end
