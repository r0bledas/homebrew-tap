class Waharness < Formula
  desc "Zero-Rated AI Agent Terminal and Remote Execution Engine over WhatsApp"
  homepage "https://github.com/r0bledas/WaHarness"
  url "https://github.com/r0bledas/WaHarness/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "c1628b33746fcd3080025f3f01ad2efb268c19c71210cc9089915bdab3452e85"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", "--omit=dev"
    libexec.install Dir["*"]
    bin.install_symlink libexec/"cli/bin/waharness" => "waharness"
    bin.install_symlink libexec/"cli/bin/waharness" => "wah"
  end

  test do
    assert_match "waharness", shell_output("#{bin}/waharness /help", 0)
  end
end
