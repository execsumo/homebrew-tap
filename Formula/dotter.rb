class Dotter < Formula
  desc "Deliberately boring dotfiles manager: plain bash, git, and symlinks"
  homepage "https://github.com/execsumo/dotter"
  url "https://github.com/execsumo/dotter/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "1bd15cd26fe1d3792ff31d148a25d32dd683274429ee5ad266ebe9bae3d26570"
  license "MIT"

  depends_on "git"

  def install
    bin.install "bin/dotfiles"
  end

  test do
    assert_match "dotfiles #{version}", shell_output("#{bin}/dotfiles version")
  end
end
