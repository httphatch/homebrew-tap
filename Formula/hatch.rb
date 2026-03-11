class Hatch < Formula
  desc "Local HTTPS reverse proxy for macOS development"
  homepage "https://github.com/httphatch/hatch"
  version "0.0.10"

  on_arm do
    url "https://github.com/httphatch/hatch/releases/download/v#{version}/hatch-darwin-arm64"
    sha256 "97f81fd5f41a7c3c0d7d365211276083c6809c3d9c99c52cdc688acaf8426b3a"
  end

  on_intel do
    url "https://github.com/httphatch/hatch/releases/download/v#{version}/hatch-darwin-amd64"
    sha256 "5441cf77ec2c47095cf31ee291bd18908b2794061ea83c9ad1181c83a2a3d2fb"
  end

  depends_on :macos

  def install
    binary_name = Hardware::CPU.arm? ? "hatch-darwin-arm64" : "hatch-darwin-amd64"
    bin.install binary_name => "hatch"
  end

  def post_install
    quiet_system bin/"hatch", "restart"
  end

  def caveats
    <<~EOS
      To get started, run:
        hatch init
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hatch version")
  end
end
