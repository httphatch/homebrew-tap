class Hatch < Formula
  desc "Local HTTPS reverse proxy for macOS development"
  homepage "https://github.com/httphatch/hatch"
  version "0.0.5"

  on_arm do
    url "https://github.com/httphatch/hatch/releases/download/v#{version}/hatch-darwin-arm64"
    sha256 "2a643750706ce08963e7770bbed165f56bd308d1adc4f00b4f3240c7ce4de154"
  end

  on_intel do
    url "https://github.com/httphatch/hatch/releases/download/v#{version}/hatch-darwin-amd64"
    sha256 "2cc0c3cb730e1cc7b9f42dd0a616aea9699d7f1be58b7aabcd6eb8dd9f7d3485"
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
