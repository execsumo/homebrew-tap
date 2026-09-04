class Dossier < Formula
  desc "Local durable memory layer for agent-driven work in Claude Code"
  homepage "https://github.com/execsumo/dossier"
  version "0.1.17"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/execsumo/dossier/releases/download/v0.1.17/dossier-darwin-arm64"
      sha256 "6c594121c0fbbe534190c224c8b8b40e64a659720649f8279960c8e0a74fa760"
    else
      url "https://github.com/execsumo/dossier/releases/download/v0.1.17/dossier-darwin-amd64"
      sha256 "45606384f340dc523b11ad1d471c49d4cea676c536b29bb33004a40199d7192c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/execsumo/dossier/releases/download/v0.1.17/dossier-linux-arm64"
      sha256 "57ecc5276b43de4c10a33d218866f3e28b3626af091fbfaa47f61ce508192bb7"
    else
      url "https://github.com/execsumo/dossier/releases/download/v0.1.17/dossier-linux-amd64"
      sha256 "8db6c6a8a215ff9d11afe31d4f91e79b7d56ba517432d05a721bc76a7985e22f"
    end
  end

  def install
    bin.install Dir["dossier-*"].first => "dossier"
  end

  test do
    system "#{bin}/dossier", "--version"
  end
end
