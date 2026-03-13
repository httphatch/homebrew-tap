class Hatch < Formula
  desc "Local HTTPS reverse proxy for macOS development"
  homepage "https://github.com/httphatch/hatch"
  version "0.0.12"

  on_arm do
    url "https://github.com/httphatch/hatch/releases/download/v#{version}/hatch-darwin-arm64"
    sha256 "1f7e05ca675a69d0163592444b80937a82c42e5ff42573ae635639d76f3ff984"
  end

  on_intel do
    url "https://github.com/httphatch/hatch/releases/download/v#{version}/hatch-darwin-amd64"
    sha256 "7fa18c20f10fe8532b8667a341cce25789fa29715a4e88c655e4135b3410205e"
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
