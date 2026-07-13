class Dossier < Formula
  desc "Local durable memory layer for agent-driven work in Claude Code"
  homepage "https://github.com/execsumo/dossiers"
  version "0.1.12"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/execsumo/dossiers/releases/download/v0.1.12/dossier-darwin-arm64"
      sha256 "5f74e1c7e6c3aded4e422afe8fd49ec63b96581c607db6fe6213dece08a8384e"
    else
      url "https://github.com/execsumo/dossiers/releases/download/v0.1.12/dossier-darwin-amd64"
      sha256 "047db291def195a9c67087efae4d3724ae79947b06de7185749d25f4ed3e367a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/execsumo/dossiers/releases/download/v0.1.12/dossier-linux-arm64"
      sha256 "5f5ccdfda4edfbe7f322ea06595ddc5e0b9669b15ef9e37b25b6cc473507d6ec"
    else
      url "https://github.com/execsumo/dossiers/releases/download/v0.1.12/dossier-linux-amd64"
      sha256 "e5170b29169e5ac8005aecfcca33e20ea29f78fa6cab1fe0102b6036f5b5fbac"
    end
  end

  def install
    bin.install Dir["dossier-*"].first => "dossier"
  end

  test do
    system "#{bin}/dossier", "--version"
  end
end
