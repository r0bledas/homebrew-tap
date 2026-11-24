class Waharness < Formula
  desc "Zero-Rated AI Agent Terminal and Remote Execution Engine over WhatsApp"
  homepage "https://github.com/r0bledas/WaHarness"
  url "https://github.com/r0bledas/WaHarness/archive/refs/tags/v1.0.5.tar.gz"
  sha256 "fcaa23ff2ae35f0883f7aa455d2502841645c1043dad0ecd658a1ffddf7d5e78"
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
