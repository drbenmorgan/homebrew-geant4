class Geant4Data < Formula
  desc "Geant4 physics data metapackage"
  homepage "https://geant4.cern.ch"
  url "file://"+File.expand_path(__FILE__)
  version "11.0.2"
  sha256 Digest::SHA256.file(File.expand_path(__FILE__)).hexdigest
  revision 1

  depends_on "g4abla"
  depends_on "g4emlow"
  depends_on "g4ensdfstate"
  depends_on "g4incl"
  depends_on "g4ndl"
  depends_on "g4particlexs"
  depends_on "g4photonevaporation"
  depends_on "g4pii"
  depends_on "g4radioactivedecay"
  depends_on "g4realsurface"
  depends_on "g4saiddata"

  def install
    # Create symlinks in one place to individual data formulae
    data_deps = Formula[name.to_s].deps
    data_deps.each do |d|
      pkgshare.install_symlink Dir[Formula[d.to_s].opt_pkgshare/"*"].first
    end
  end

  test do
    system "false"
  end
end
