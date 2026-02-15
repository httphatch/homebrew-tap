class Hatch < Formula
  desc "Local HTTPS reverse proxy for macOS development"
  homepage "https://github.com/httphatch/hatch"
  version "0.0.1"

  on_arm do
    url "https://github.com/httphatch/hatch/releases/download/v.#{version}/hatch-darwin-arm64"
    sha256 "e4cde6461dc5596925d2a4fe302202de76b5b86582136d049dfc98a729f516b9"
  end

  on_intel do
    url "https://github.com/httphatch/hatch/releases/download/v.#{version}/hatch-darwin-amd64"
    sha256 "3f127d3a5197cf8c56e5e01039fdd873d621bfb8f363b134587a06a26f9dd08f"
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
