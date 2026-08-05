class Dossier < Formula
  desc "Local durable memory layer for agent-driven work in Claude Code"
  homepage "https://github.com/execsumo/dossier"
  version "0.1.14"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/execsumo/dossier/releases/download/v0.1.14/dossier-darwin-arm64"
      sha256 "053bd7a9453b8218068bb3bc32c7b6854437a647582746ecebfec0ee8d8fff23"
    else
      url "https://github.com/execsumo/dossier/releases/download/v0.1.14/dossier-darwin-amd64"
      sha256 "334eb18c24789193c2aacca24d68659cafbff7df6df041a9cb13eb332e307cdb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/execsumo/dossier/releases/download/v0.1.14/dossier-linux-arm64"
      sha256 "f9fdb9c8d09bc99ae3a48ef5ea8950f4e45994dc1839bad550154035fc2c7724"
    else
      url "https://github.com/execsumo/dossier/releases/download/v0.1.14/dossier-linux-amd64"
      sha256 "1496ad3c414e55ffcae85c3faa3c6d55d876167726a8d43c99dd0813778845ff"
    end
  end

  def install
    bin.install Dir["dossier-*"].first => "dossier"
  end

  test do
    system "#{bin}/dossier", "--version"
  end
end
