class Hatch < Formula
  desc "Local HTTPS reverse proxy for macOS development"
  homepage "https://github.com/httphatch/hatch"
  version "0.0.1"

  on_arm do
    url "https://github.com/httphatch/hatch/releases/download/v#{version}/hatch-darwin-arm64"
    sha256 "4cbfa33ddb7f2b46ac571938e3f639a7fe952fc0cc4223eb068a473636bc41f7"
  end

  on_intel do
    url "https://github.com/httphatch/hatch/releases/download/v#{version}/hatch-darwin-amd64"
    sha256 "c009f9a8af76226522fa92effb888c28120599d216616b178a5c292bfa237389"
  end

  depends_on :macos

  def install
    binary_name = Hardware::CPU.arm? ? "hatch-darwin-arm64" : "hatch-darwin-amd64"
    bin.install binary_name => "hatch"
    generate_completions_from_executable(bin/"hatch", "completion")
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
