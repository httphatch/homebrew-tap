class Hatch < Formula
  desc "Local HTTPS reverse proxy for macOS development"
  homepage "https://github.com/httphatch/hatch"
  version "0.0.7"

  on_arm do
    url "https://github.com/httphatch/hatch/releases/download/v#{version}/hatch-darwin-arm64"
    sha256 "a108ba7d6098bfe8ce3776807bef54632b4a8250b5b0833ced98ab262e226eaa"
  end

  on_intel do
    url "https://github.com/httphatch/hatch/releases/download/v#{version}/hatch-darwin-amd64"
    sha256 "08ec9304dd2f79392982743652fa786dd0958b7f2e53836130c2c89434f35302"
  end

  depends_on :macos

  def install
    binary_name = Hardware::CPU.arm? ? "hatch-darwin-arm64" : "hatch-darwin-amd64"
    bin.install binary_name => "hatch"
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
