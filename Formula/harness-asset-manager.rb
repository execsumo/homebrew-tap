class HarnessAssetManager < Formula
  desc "Local app and browser UI for universal skill management across agent harnesses"
  homepage "https://github.com/execsumo/harness-asset-manager"
  license "MIT"
  version "0.4.0"
  preserve_rpath

  on_arm do
    url "https://github.com/execsumo/harness-asset-manager/releases/download/v0.4.0/harness-asset-manager-v0.4.0-darwin-arm64.tar.gz"
    sha256 "6fa01c21682c662438e3b80d5acb8bd6323d31c83421d347f5c9afbea4c747df"
  end

  on_intel do
    url "https://github.com/execsumo/harness-asset-manager/releases/download/v0.4.0/harness-asset-manager-v0.4.0-darwin-x64.tar.gz"
    sha256 "90be6d82eb39f98bed00cff169aab4ced5bac335be0e4a0ea013ec406d1ffc98"
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
    assert_match "0.4.0", output
  end
end
