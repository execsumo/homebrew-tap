class Dossier < Formula
  desc "Local durable memory layer for agent-driven work in Claude Code"
  homepage "https://github.com/execsumo/dossier"
  version "0.5.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/execsumo/dossier/releases/download/v0.5.3/dossier-darwin-arm64"
      sha256 "b47b54c3ae61ec155fa71a4d65d13a8f804630623020aaa28b9747af14a9cd60"
    else
      url "https://github.com/execsumo/dossier/releases/download/v0.5.3/dossier-darwin-amd64"
      sha256 "d3483461834cd29d850b963029445b37643c3692f9a9d4f1eb6956c3e9d303a1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/execsumo/dossier/releases/download/v0.5.3/dossier-linux-arm64"
      sha256 "1c5c3bd6bfd417b0272de2df6e0af8350c0a62ecdb111b412542b852f97cbca2"
    else
      url "https://github.com/execsumo/dossier/releases/download/v0.5.3/dossier-linux-amd64"
      sha256 "7ad3bb4cd180d85646f484ed57c429b5d04b1377d739553fd4e47b2e1ba20e2f"
    end
  end

  def install
    bin.install Dir["dossier-*"].first => "dossier"
  end

  test do
    system "#{bin}/dossier", "--version"
  end
end
