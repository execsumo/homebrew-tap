class Dossier < Formula
  desc "Local durable memory layer for agent-driven work in Claude Code"
  homepage "https://github.com/execsumo/dossier"
  version "0.2.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/execsumo/dossier/releases/download/v0.2.6/dossier-darwin-arm64"
      sha256 "db91265b2db23ed10b18a655160a2654dac8a4bfb9d8ccbf74a09061ba55da59"
    else
      url "https://github.com/execsumo/dossier/releases/download/v0.2.6/dossier-darwin-amd64"
      sha256 "3a5ba6f7e6ee29aa8d4e311738e4512fac7ad16b68b35683547332544997645b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/execsumo/dossier/releases/download/v0.2.6/dossier-linux-arm64"
      sha256 "491cd5cb24ac34a3dd8c31b107208b87f4fd45082a2af67da2319cfaf3d8e088"
    else
      url "https://github.com/execsumo/dossier/releases/download/v0.2.6/dossier-linux-amd64"
      sha256 "252e3b64cb1fba335815df59b7e260038f7104d3d2266271affd54d2b7dab3bb"
    end
  end

  def install
    bin.install Dir["dossier-*"].first => "dossier"
  end

  test do
    system "#{bin}/dossier", "--version"
  end
end
