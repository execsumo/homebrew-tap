class Dossier < Formula
  desc "Local durable memory layer for agent-driven work in Claude Code"
  homepage "https://github.com/execsumo/dossier"
  version "0.5.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/execsumo/dossier/releases/download/v0.5.1/dossier-darwin-arm64"
      sha256 "b88dc7e6a9f022213e47783a6b803739f8f2d512fcd9bcf979567932f39cd60b"
    else
      url "https://github.com/execsumo/dossier/releases/download/v0.5.1/dossier-darwin-amd64"
      sha256 "5c5b6fc034abca68f123c664d5c58264aacbbffe715af87c1db8d88a54bd37ac"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/execsumo/dossier/releases/download/v0.5.1/dossier-linux-arm64"
      sha256 "f7317a56a9dee7d8688f246af50c39b9df25c36a5fbd9072933e52927b02091b"
    else
      url "https://github.com/execsumo/dossier/releases/download/v0.5.1/dossier-linux-amd64"
      sha256 "159cdbc1b16d2a4345124bc1898d2abedc7a4efab57a0287c63c81f214db7f7c"
    end
  end

  def install
    bin.install Dir["dossier-*"].first => "dossier"
  end

  test do
    system "#{bin}/dossier", "--version"
  end
end
