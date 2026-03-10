class Owl < Formula
  desc "AI desktop automation MCP server — give your AI eyes and hands"
  homepage "https://license-portal-bay.vercel.app"
  version "0.3.0"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://dedjlsvrwafhyznaazbm.supabase.co/storage/v1/object/public/releases/v0.3.0/owl-darwin-arm64"
      sha256 "50da4b7c99f1e9e4661ac2f909a172da2494d1e57f345961064ed3bf319c22ae"

      def install
        bin.install "owl-darwin-arm64" => "owl"
      end
    end
  end

  def caveats
    <<~EOS
      To use OpenOwl, you need a license key:
        1. Sign up at https://license-portal-bay.vercel.app
        2. Generate a key in Dashboard → Licenses
        3. Save it:
           mkdir -p ~/.openowl
           echo "owl-xxxx-xxxx-xxxx" > ~/.openowl/license.key

      Then add to Claude Code (~/.claude/settings.json):
        {
          "mcpServers": {
            "owl": { "command": "owl" }
          }
        }

      Free tier: 100 tool calls/day. Upgrade for unlimited.

      macOS will ask for Accessibility and Screen Recording permissions
      on first use. Grant both in System Settings → Privacy & Security.
    EOS
  end

  test do
    assert_match "OpenOwl", shell_output("#{bin}/owl --help 2>&1", 1)
  end
end
