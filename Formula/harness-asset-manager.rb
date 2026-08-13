class HarnessAssetManager < Formula
  desc "Local app and browser UI for universal skill management across agent harnesses"
  homepage "https://github.com/execsumo/harness-asset-manager"
  license "MIT"
  version "0.3.3"
  preserve_rpath

  on_arm do
    url "https://github.com/execsumo/harness-asset-manager/releases/download/v0.3.3/harness-asset-manager-v0.3.3-darwin-arm64.tar.gz"
    sha256 "979fae76065091e45332da0ad23eb04327fe32a337f41fbae4158a87ef7732c2"
  end

  on_intel do
    url "https://github.com/execsumo/harness-asset-manager/releases/download/v0.3.3/harness-asset-manager-v0.3.3-darwin-x64.tar.gz"
    sha256 "be9ee8b31357a33153044ec8933a2fe27cfd4c74afef79a7e4a4e708f8679e65"
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
    assert_match "0.3.3", output
  end
end
