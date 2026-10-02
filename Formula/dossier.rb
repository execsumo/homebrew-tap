class Dossier < Formula
  desc "Local durable memory layer for agent-driven work in Claude Code"
  homepage "https://github.com/execsumo/dossier"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/execsumo/dossier/releases/download/v0.3.0/dossier-darwin-arm64"
      sha256 "2dbd05f6af9c2c5a355b1ac26a51b217e488cf78206d7171947d56710ceb25ee"
    else
      url "https://github.com/execsumo/dossier/releases/download/v0.3.0/dossier-darwin-amd64"
      sha256 "1ca54ec3c37ab2130a83aca1a15efd1405958e8c64669905bc6bd589a64a2aa5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/execsumo/dossier/releases/download/v0.3.0/dossier-linux-arm64"
      sha256 "a586dd137755d65f677663bcbcd45a6420f1588eb396982c901cdfb12a00bd82"
    else
      url "https://github.com/execsumo/dossier/releases/download/v0.3.0/dossier-linux-amd64"
      sha256 "57b40135fc6fffab9fbcad52f18777e35b97773c5ab22995dbdab6236b4195e9"
    end
  end

  def install
    bin.install Dir["dossier-*"].first => "dossier"
  end

  test do
    system "#{bin}/dossier", "--version"
  end
end
