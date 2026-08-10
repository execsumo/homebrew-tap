class HarnessAssetManager < Formula
  desc "Local app and browser UI for universal skill management across agent harnesses"
  homepage "https://github.com/execsumo/harness-asset-manager"
  license "MIT"
  version "0.3.2"
  preserve_rpath

  on_arm do
    url "https://github.com/execsumo/harness-asset-manager/releases/download/v0.3.2/harness-asset-manager-v0.3.2-darwin-arm64.tar.gz"
    sha256 "2cbb477e156f1d350741ccf99c97b5b747a121976e06dfdc7c8e22903b10c870"
  end

  on_intel do
    url "https://github.com/execsumo/harness-asset-manager/releases/download/v0.3.2/harness-asset-manager-v0.3.2-darwin-x64.tar.gz"
    sha256 "5439e19e887fb1543ebbbc88612ad6c7ae758171ff996cf016cb1645fd7a3cd8"
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
    assert_match "0.3.2", output
  end
end
