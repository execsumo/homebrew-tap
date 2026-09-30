class Dossier < Formula
  desc "Local durable memory layer for agent-driven work in Claude Code"
  homepage "https://github.com/execsumo/dossier"
  version "0.2.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/execsumo/dossier/releases/download/v0.2.10/dossier-darwin-arm64"
      sha256 "bbc5c5727fa60c003e973c9eb511ce8ef05a157f7ffbd6f65eb1eea8938e09fa"
    else
      url "https://github.com/execsumo/dossier/releases/download/v0.2.10/dossier-darwin-amd64"
      sha256 "efe2d79e0b7f7b4cb894a0caa2e1fd0221643cb4de6b2df1df10287c57c59e3d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/execsumo/dossier/releases/download/v0.2.10/dossier-linux-arm64"
      sha256 "072db4857934e62ba99d99707f69061c4e465125e33a172ba21dffdcd1c36c0b"
    else
      url "https://github.com/execsumo/dossier/releases/download/v0.2.10/dossier-linux-amd64"
      sha256 "a95fb364b26c28492cc5311be240b2f8909d5e8e6d5efafc07a36a78124bd0e1"
    end
  end

  def install
    bin.install Dir["dossier-*"].first => "dossier"
  end

  test do
    system "#{bin}/dossier", "--version"
  end
end
