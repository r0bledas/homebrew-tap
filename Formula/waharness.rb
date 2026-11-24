class Waharness < Formula
  desc "Zero-Rated AI Agent Terminal and Remote Execution Engine over WhatsApp"
  homepage "https://github.com/r0bledas/WaHarness"
  url "https://github.com/r0bledas/WaHarness/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "384ca0a3e39d77dc20b3fb25dab0743ba73795ba4fa2920a11dff38442b3f778"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", "--omit=dev"
    libexec.install Dir["*"]
    (bin/"waharness").write_env_script libexec/"cli/bin/waharness", PATH: "#{Formula["node"].opt_bin}:$PATH"
    (bin/"wah").write_env_script libexec/"cli/bin/waharness", PATH: "#{Formula["node"].opt_bin}:$PATH"
  end

  test do
    system "#{bin}/waharness", "/status"
  end
end
