class Dossier < Formula
  desc "Local durable memory layer for agent-driven work in Claude Code"
  homepage "https://github.com/execsumo/dossiers"
  version "0.1.11"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/execsumo/dossiers/releases/download/v#{version}/dossier-darwin-arm64"
      sha256 "c2e18ae035bdd588b382815a3e2c4d590957b59786c6613f47e308eb5128d899"
    else
      url "https://github.com/execsumo/dossiers/releases/download/v#{version}/dossier-darwin-amd64"
      sha256 "f5061303a1c1d0d6b9ebe890860c11db410c8dad91c047ba5bffe1bd79b73af3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/execsumo/dossiers/releases/download/v#{version}/dossier-linux-arm64"
      sha256 "e521e5182c8e68e11e8fd0f3d78539312ffb2d303ac44169202a95ae86b881be"
    else
      url "https://github.com/execsumo/dossiers/releases/download/v#{version}/dossier-linux-amd64"
      sha256 "70314a649cdd6ac46486e731399689c2524147020c0f296b0b725fb069296208"
    end
  end

  def install
    bin.install Dir["dossier-*"].first => "dossier"
  end

  test do
    system "#{bin}/dossier", "--version"
  end
end
