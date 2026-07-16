class Dossier < Formula
  desc "Local durable memory layer for agent-driven work in Claude Code"
  homepage "https://github.com/execsumo/dossiers"
  version "0.1.13"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/execsumo/dossiers/releases/download/v0.1.13/dossier-darwin-arm64"
      sha256 "3b222250b58bd22848c44000436e2427aac465daa27c274c39379fff3d96f8cd"
    else
      url "https://github.com/execsumo/dossiers/releases/download/v0.1.13/dossier-darwin-amd64"
      sha256 "15f18c65a00c708a969276a980a50a8a47233968deedf0aa410ebd647a5d926f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/execsumo/dossiers/releases/download/v0.1.13/dossier-linux-arm64"
      sha256 "f15e04c0af1531fac86aa3d10ad0761e4d3529cc7318809119f82db73203256f"
    else
      url "https://github.com/execsumo/dossiers/releases/download/v0.1.13/dossier-linux-amd64"
      sha256 "b949eed4d1b714f5edb3ee018dc4671b2ca1c7bfb569837a48f3a0a153b1d5d0"
    end
  end

  def install
    bin.install Dir["dossier-*"].first => "dossier"
  end

  test do
    system "#{bin}/dossier", "--version"
  end
end
