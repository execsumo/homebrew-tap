class Dossier < Formula
  desc "Local durable memory layer for agent-driven work in Claude Code"
  homepage "https://github.com/execsumo/dossier"
  version "0.2.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/execsumo/dossier/releases/download/v0.2.7/dossier-darwin-arm64"
      sha256 "603a8296f9d3d5237c9d08e9d186df9989f6d208015aabaf28b23435309475bc"
    else
      url "https://github.com/execsumo/dossier/releases/download/v0.2.7/dossier-darwin-amd64"
      sha256 "36f4d7be48cc90c1d6e231a06ad827aa664954b7efbc8bb7208cfe8d6a0d96fa"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/execsumo/dossier/releases/download/v0.2.7/dossier-linux-arm64"
      sha256 "9040ecb2911b500bf67f0806010149396b463ca554d36f26f79d460a5e1b807e"
    else
      url "https://github.com/execsumo/dossier/releases/download/v0.2.7/dossier-linux-amd64"
      sha256 "acabd26a8a87e66a814e3fcd9620e88c2a49809cfebf1203764a7f9b66a0a3aa"
    end
  end

  def install
    bin.install Dir["dossier-*"].first => "dossier"
  end

  test do
    system "#{bin}/dossier", "--version"
  end
end
