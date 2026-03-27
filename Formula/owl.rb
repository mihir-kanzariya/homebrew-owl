class Owl < Formula
  desc "AI desktop automation MCP server — give your AI eyes and hands"
  homepage "https://openowl.dev"
  version "0.3.11"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/mihir-kanzariya/openowl-releases/releases/download/v0.3.11/owl-darwin-arm64.tar.gz"
      sha256 "1c0d7e4ab81d8e6e0efb6290d7daf541a64c9d177e730d18a05039eeb9d20d64"

      def install
        libexec.install Dir["*"]
        bin.install_symlink libexec/"owl-darwin-arm64" => "owl"
      end
    end

    on_intel do
      url "https://github.com/mihir-kanzariya/openowl-releases/releases/download/v0.3.11/owl-darwin-x64.tar.gz"
      sha256 "c950c749af41610a8aa521bf26b45cf2e14ffe42b4eb9d1e7598845f4001b3a7"

      def install
        libexec.install Dir["*"]
        bin.install_symlink libexec/"owl-darwin-x86_64" => "owl"
      end
    end
  end

  def caveats
    <<~EOS
      To use OpenOwl, you need an API key:
        1. Sign up at https://openowl.dev/quick-setup
        2. Your key is generated automatically on signup
        3. Save it:
 mkdir -p ~/.openowl
 echo "owl-xxxx-xxxx-xxxx" > ~/.openowl/api.key

      Then register with Claude Code:
        claude mcp add owl --transport stdio -s user -- owl

      Free tier: 50 tool calls/day. Upgrade for unlimited.

      macOS will ask for Accessibility and Screen Recording permissions
      on first use. Grant both in System Settings > Privacy & Security.
    EOS
  end

  test do
    assert_match "OpenOwl", shell_output("#{bin}/owl --help 2>&1", 1)
  end
end
