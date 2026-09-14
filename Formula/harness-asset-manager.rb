class HarnessAssetManager < Formula
  desc "Local app and browser UI for universal skill management across agent harnesses"
  homepage "https://github.com/execsumo/harness-asset-manager"
  license "MIT"
  version "0.5.8"
  preserve_rpath

  on_arm do
    url "https://github.com/execsumo/harness-asset-manager/releases/download/v0.5.8/harness-asset-manager-v0.5.8-darwin-arm64.tar.gz"
    sha256 "67c5e031826b6e10f35f829bb954a503cc845a89e6af0fa0ac247525d10115e3"
  end

  on_intel do
    url "https://github.com/execsumo/harness-asset-manager/releases/download/v0.5.8/harness-asset-manager-v0.5.8-darwin-x64.tar.gz"
    sha256 "0ecb9f1e8d83918bc107123aef51e9abd1fe403828067700d6f90a795bf26d4f"
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
    assert_match "0.5.8", output
  end
end
