class Dossier < Formula
  desc "Local durable memory layer for agent-driven work in Claude Code"
  homepage "https://github.com/execsumo/dossier"
  version "0.2.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/execsumo/dossier/releases/download/v0.2.5/dossier-darwin-arm64"
      sha256 "64febf8badb3a15ba347ea62668a06571242cc4ac0c1b7b98c7029f6ee8206bf"
    else
      url "https://github.com/execsumo/dossier/releases/download/v0.2.5/dossier-darwin-amd64"
      sha256 "fc58f5f2973caed74522bcf46c81250923589b231aeb3986af67b7e080fbfdac"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/execsumo/dossier/releases/download/v0.2.5/dossier-linux-arm64"
      sha256 "db2b7c47f92a6e8f6ce1a8a41015a0dedb23abf181a0a9d21b1d3b38bfe6ba3c"
    else
      url "https://github.com/execsumo/dossier/releases/download/v0.2.5/dossier-linux-amd64"
      sha256 "a42de2f116e46f13a08ac82fcaae5b1b145b2f459007ca60a371e13318ff4ee3"
    end
  end

  def install
    bin.install Dir["dossier-*"].first => "dossier"
  end

  test do
    system "#{bin}/dossier", "--version"
  end
end
