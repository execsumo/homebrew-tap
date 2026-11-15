class HarnessAssetManager < Formula
  desc "Local app and browser UI for universal skill management across agent harnesses"
  homepage "https://github.com/execsumo/harness-asset-manager"
  license "MIT"
  version "0.5.23"
  preserve_rpath

  on_arm do
    url "https://github.com/execsumo/harness-asset-manager/releases/download/v0.5.23/harness-asset-manager-v0.5.23-darwin-arm64.tar.gz"
    sha256 "3c9ba876a73abf47c53b2fe7537184fab4eff77630f77de56c7afe15082886b1"
  end

  on_intel do
    url "https://github.com/execsumo/harness-asset-manager/releases/download/v0.5.23/harness-asset-manager-v0.5.23-darwin-x64.tar.gz"
    sha256 "d0c5f3609105e959feb00e4c4d2bef6beabc6ea97aa697a66ac81057372cc619"
  end

  def install
    staged_root = (buildpath/"harness-asset-manager").directory? ? buildpath/"harness-asset-manager" : buildpath
    libexec.install staged_root.children
    bin.install_symlink libexec/"harness-asset-manager" => "harnessam"
  end

  def caveats
    <<~EOS
      If `harnessam: command not found`, Homebrew's bin directory isn't on your PATH yet:
        eval "$(brew shellenv)"
      Add that line to your shell profile (~/.zprofile or ~/.bash_profile) to make it permanent.
    EOS
  end

  test do
    output = shell_output("#{bin}/harnessam --version")
    assert_match "0.5.23", output
  end
end
