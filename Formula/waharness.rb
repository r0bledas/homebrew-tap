class Waharness < Formula
  desc "Zero-Rated AI Agent Terminal and Remote Execution Engine over WhatsApp"
  homepage "https://github.com/r0bledas/WaHarness"
  url "https://github.com/r0bledas/WaHarness/archive/refs/tags/v1.2.4.tar.gz"
  sha256 "243355f726a598c659ba4382737e57dd606ea9bd325942e8cffe37ca633d07da"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", "--omit=dev"
    chmod 0755, "cli/bin/waharness"
    chmod 0755, "cli/tui.js"
    libexec.install Dir["*"]
    (bin/"waharness").write_env_script libexec/"cli/bin/waharness", PATH: "#{Formula["node"].opt_bin}:$PATH"
    (bin/"wah").write_env_script libexec/"cli/bin/waharness", PATH: "#{Formula["node"].opt_bin}:$PATH"
  end

  test do
    system "#{bin}/waharness", "--version"
  end
end
