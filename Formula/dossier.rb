class Dossier < Formula
  desc "Local durable memory layer for agent-driven work in Claude Code"
  homepage "https://github.com/execsumo/dossier"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/execsumo/dossier/releases/download/v0.5.0/dossier-darwin-arm64"
      sha256 "78552e04fe9469d0a383c775c7dcc0b240a386db778a44bc83264e1a005e2a5f"
    else
      url "https://github.com/execsumo/dossier/releases/download/v0.5.0/dossier-darwin-amd64"
      sha256 "ac7e73cba3d4fe41af8d26bfa72efc13ed459cbc47d63bab47abe5aa9157f837"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/execsumo/dossier/releases/download/v0.5.0/dossier-linux-arm64"
      sha256 "d93d482ff29fdb2c7ab7c94b7b4f970f5fcf372ac4576b816b41563c2ac4bbbc"
    else
      url "https://github.com/execsumo/dossier/releases/download/v0.5.0/dossier-linux-amd64"
      sha256 "a8e864bc620dea1160a0e7eb185e9c95bfc0da40cdfaa2d06532b5dd727936e8"
    end
  end

  def install
    bin.install Dir["dossier-*"].first => "dossier"
  end

  test do
    system "#{bin}/dossier", "--version"
  end
end
