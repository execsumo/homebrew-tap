class Dossier < Formula
  desc "Local durable memory layer for agent-driven work in Claude Code"
  homepage "https://github.com/execsumo/dossiers"
  version "0.1.11"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/execsumo/dossiers/releases/download/v0.1.11/dossier-darwin-arm64"
      sha256 "382b2a6a7a1f2d6d0704ff6228b0d7297ba7a00c5bbe1505ae48f5d8ab373381"
    else
      url "https://github.com/execsumo/dossiers/releases/download/v0.1.11/dossier-darwin-amd64"
      sha256 "b8f4851789b701545bac137461c97e352539f34481bb070f47e79893d15e747a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/execsumo/dossiers/releases/download/v0.1.11/dossier-linux-arm64"
      sha256 "f61382d2172bcf9fe443e26182ad5e169d66df72836c003b74a72066b0c1a35a"
    else
      url "https://github.com/execsumo/dossiers/releases/download/v0.1.11/dossier-linux-amd64"
      sha256 "1b97a213e8d76f33b20321bf91e645c0d895392220a3cce7e9c51b36c4972759"
    end
  end

  def install
    bin.install Dir["dossier-*"].first => "dossier"
  end

  test do
    system "#{bin}/dossier", "--version"
  end
end
