class Owl < Formula
  desc "AI desktop automation MCP server — give your AI eyes and hands"
  homepage "https://license-portal-bay.vercel.app"
  version "0.3.0"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://dedjlsvrwafhyznaazbm.supabase.co/storage/v1/object/public/releases/v0.3.0/owl-darwin-arm64.tar.gz"
      sha256 "f37f013cc501c0a30dd6637064bf04a1d6573c70d3c51b19b872a4d9bdfd888b"

      def install
        libexec.install Dir["*"]
        bin.install_symlink libexec/"owl-darwin-arm64" => "owl"
      end
    end

    on_intel do
      url "https://dedjlsvrwafhyznaazbm.supabase.co/storage/v1/object/public/releases/v0.3.0/owl-darwin-x64.tar.gz"
      sha256 "87bbb8a027664cbdd9e63670360cfc61fc33d8a5ab93542dfe6440a6a24d5218"

      def install
        libexec.install Dir["*"]
        bin.install_symlink libexec/"owl-darwin-x86_64" => "owl"
      end
    end
  end

  def caveats
    <<~EOS
      To use OpenOwl, you need a license key:
        1. Sign up at https://license-portal-bay.vercel.app/quick-setup
        2. Your key is generated automatically on signup
        3. Save it:
           mkdir -p ~/.openowl
           echo "owl-xxxx-xxxx-xxxx" > ~/.openowl/license.key

      Then register with Claude Code:
        claude mcp add owl --transport stdio -s user -- owl

      Free tier: 100 tool calls/day. Upgrade for unlimited.

      macOS will ask for Accessibility and Screen Recording permissions
      on first use. Grant both in System Settings → Privacy & Security.
    EOS
  end

  test do
    assert_match "OpenOwl", shell_output("#{bin}/owl --help 2>&1", 1)
  end
end
