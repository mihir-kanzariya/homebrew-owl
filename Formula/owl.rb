class Owl < Formula
  desc "AI desktop automation MCP server — give your AI eyes and hands"
  homepage "https://openowl.dev"
  version "0.3.14"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/mihir-kanzariya/openowl-releases/releases/download/v0.3.14/owl-darwin-arm64.tar.gz"
      sha256 "21182b3a4e943727ce604b121401811a9a6356582c4c399199527bc01fc18edf"

      def install
        libexec.install Dir["*"]
        bin.install_symlink libexec/"owl-darwin-arm64" => "owl"
      end
    end

    on_intel do
      url "https://github.com/mihir-kanzariya/openowl-releases/releases/download/v0.3.14/owl-darwin-x64.tar.gz"
      sha256 "7f6e24024693e8f7ff5e4f10e4e2686c7dc9a9bfca8ebb95a4ea118759903ebc"

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
