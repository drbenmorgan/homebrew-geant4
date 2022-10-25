class Geant4Data < Formula
  desc "Geant4 physics data metapackage"
  homepage "https://geant4.web.cern.ch"
  url "file://"+File.expand_path(__FILE__)
  version "11.0.2"
  sha256 Digest::SHA256.file(File.expand_path(__FILE__)).hexdigest
  revision 2

  bottle do
    root_url "https://ghcr.io/v2/drbenmorgan/geant4"
    sha256 cellar: :any_skip_relocation, monterey:     "e459703855fbf7f45a49d82637a1ad3ee0d4e4fd3c15e3a4993f3b45b0eda36e"
    sha256 cellar: :any_skip_relocation, big_sur:      "ed7ab997e54785c815d3e2ad337aa97348c427a3febce53da0ff93852db860cf"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "5a8cee348e4022dcf49ab57dbf36f2a197e2be61205c3813186b40b3410946e8"
  end

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
    assert_predicate pkgshare, :exist?
  end
end
