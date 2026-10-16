class Dossier < Formula
  desc "Local durable memory layer for agent-driven work in Claude Code"
  homepage "https://github.com/execsumo/dossier"
  version "0.5.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/execsumo/dossier/releases/download/v0.5.2/dossier-darwin-arm64"
      sha256 "3d5b29efd1b3c6457367b72b52d3d3520b99c3e6f4de7c571904fdda76638eb6"
    else
      url "https://github.com/execsumo/dossier/releases/download/v0.5.2/dossier-darwin-amd64"
      sha256 "7767bc6569923688503105d363bb22ff242074e562c714a724bcab74f8af7f62"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/execsumo/dossier/releases/download/v0.5.2/dossier-linux-arm64"
      sha256 "901bf7e5723388b46dbc640c8096e333e1c9c0fb5c1bdae3fa321bb31e05cb6e"
    else
      url "https://github.com/execsumo/dossier/releases/download/v0.5.2/dossier-linux-amd64"
      sha256 "f0760146e0b0c66b324ee7611a886cca8f3354ea5e081b91ea3b764180f638cf"
    end
  end

  def install
    bin.install Dir["dossier-*"].first => "dossier"
  end

  test do
    system "#{bin}/dossier", "--version"
  end
end
