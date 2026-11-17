class Dotter < Formula
  desc "Deliberately boring dotfiles manager: plain bash, git, and symlinks"
  homepage "https://github.com/execsumo/dotter"
  url "https://github.com/execsumo/dotter/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "23143b7b0bc44b8aac1c296285baf1946229561b321bb2cb115790ed88b6fb5e"
  license "MIT"

  depends_on "git"

  def install
    bin.install "bin/dotfiles"
  end

  test do
    assert_match "dotfiles #{version}", shell_output("#{bin}/dotfiles version")
  end
end
