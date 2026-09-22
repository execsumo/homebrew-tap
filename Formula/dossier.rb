class Dossier < Formula
  desc "Local durable memory layer for agent-driven work in Claude Code"
  homepage "https://github.com/execsumo/dossier"
  version "0.2.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/execsumo/dossier/releases/download/v0.2.8/dossier-darwin-arm64"
      sha256 "f74306963f7cdca393fcc35b3f9942bd5bfb8c156202bf88a4d8528f5903468c"
    else
      url "https://github.com/execsumo/dossier/releases/download/v0.2.8/dossier-darwin-amd64"
      sha256 "e6ee4e241aaa381ca1b5621c58814330bdd88ff989112024b91d11fe809e65be"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/execsumo/dossier/releases/download/v0.2.8/dossier-linux-arm64"
      sha256 "07582f559941a1f57d649e74cb98e6d684b4a4fcc933b46d78bf038231e90806"
    else
      url "https://github.com/execsumo/dossier/releases/download/v0.2.8/dossier-linux-amd64"
      sha256 "a0a562cbafa4675c873f1ed2279551b92d93030d3e7232064a8c01f6f25f798f"
    end
  end

  def install
    bin.install Dir["dossier-*"].first => "dossier"
  end

  test do
    system "#{bin}/dossier", "--version"
  end
end
