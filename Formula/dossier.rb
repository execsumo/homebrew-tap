class Dossier < Formula
  desc "Local durable memory layer for agent-driven work in Claude Code"
  homepage "https://github.com/execsumo/dossier"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/execsumo/dossier/releases/download/v0.4.0/dossier-darwin-arm64"
      sha256 "528e3c31259b5b54e7b859b908008268477377594cacdfa91fd63f298369836c"
    else
      url "https://github.com/execsumo/dossier/releases/download/v0.4.0/dossier-darwin-amd64"
      sha256 "188bf931488c1e0a33fae9f5a831e49146c2f3c56fc900e10f7636474916e15a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/execsumo/dossier/releases/download/v0.4.0/dossier-linux-arm64"
      sha256 "00eac9d2806cf68d82ff424da0f2508e986e9c92cca2217dc20cb69c6e2a6dfd"
    else
      url "https://github.com/execsumo/dossier/releases/download/v0.4.0/dossier-linux-amd64"
      sha256 "c4f0307be09837fa1d33bc576a719bbef65ddb0185e4e97695f75d0e977fa920"
    end
  end

  def install
    bin.install Dir["dossier-*"].first => "dossier"
  end

  test do
    system "#{bin}/dossier", "--version"
  end
end
