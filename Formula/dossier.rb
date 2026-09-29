class Dossier < Formula
  desc "Local durable memory layer for agent-driven work in Claude Code"
  homepage "https://github.com/execsumo/dossier"
  version "0.2.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/execsumo/dossier/releases/download/v0.2.9/dossier-darwin-arm64"
      sha256 "c60e39671bf7d8ced8520ff5e77ec04f5199b47b731eb46166e3ffe0443f1615"
    else
      url "https://github.com/execsumo/dossier/releases/download/v0.2.9/dossier-darwin-amd64"
      sha256 "59fa07a574c52f4063168407999d77b67ac42ebaa6c934c4fd1aec5770980d63"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/execsumo/dossier/releases/download/v0.2.9/dossier-linux-arm64"
      sha256 "72a028f51e7909c7839162f928a00670a8f5a30ddddbc7e5a0ea47290c9ffcea"
    else
      url "https://github.com/execsumo/dossier/releases/download/v0.2.9/dossier-linux-amd64"
      sha256 "b0ee55179f3b0332080a5f21ef3fcd85ae4c7cb87a51825074bf8b0cb482ce21"
    end
  end

  def install
    bin.install Dir["dossier-*"].first => "dossier"
  end

  test do
    system "#{bin}/dossier", "--version"
  end
end
