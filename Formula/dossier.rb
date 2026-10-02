class Dossier < Formula
  desc "Local durable memory layer for agent-driven work in Claude Code"
  homepage "https://github.com/execsumo/dossier"
  version "0.3.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/execsumo/dossier/releases/download/v0.3.1/dossier-darwin-arm64"
      sha256 "d652dd1f1f650e72d4f49ec065b53898a1827505c844ed81756eb1f7ac786952"
    else
      url "https://github.com/execsumo/dossier/releases/download/v0.3.1/dossier-darwin-amd64"
      sha256 "cd751454710027358642621df2e945abbc569dabdda59f75b60c6e40f3b5292b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/execsumo/dossier/releases/download/v0.3.1/dossier-linux-arm64"
      sha256 "2792b2f6331d871aa48b8b1782a4835fec3665f07d7d3f89f9fa74ab61d39ee7"
    else
      url "https://github.com/execsumo/dossier/releases/download/v0.3.1/dossier-linux-amd64"
      sha256 "4c209a2f74981dd8a8e6304014f2f153acee65eeb55359745c036de75b982ef4"
    end
  end

  def install
    bin.install Dir["dossier-*"].first => "dossier"
  end

  test do
    system "#{bin}/dossier", "--version"
  end
end
