class Owl < Formula
  desc "AI desktop automation MCP server — give your AI eyes and hands"
  homepage "https://license-portal-bay.vercel.app"
  version "0.3.0"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://dedjlsvrwafhyznaazbm.supabase.co/storage/v1/object/public/releases/v0.3.0/owl-darwin-arm64.tar.gz"
      sha256 "88e343954a0ed04edc2cf5656cfcc231e9b962b90acbf837b35f77140ce506b0"

      def install
        libexec.install Dir["*"]
        bin.install_symlink libexec/"owl-darwin-arm64" => "owl"
      end
    end

    on_intel do
      url "https://dedjlsvrwafhyznaazbm.supabase.co/storage/v1/object/public/releases/v0.3.0/owl-darwin-x64.tar.gz"
      sha256 "f7e44c48f4e85d868181a3d8646c43bdef19aeb6d2d5c3c676d19d268a1233b2"

      def install
        libexec.install Dir["*"]
        bin.install_symlink libexec/"owl-darwin-x86_64.bin" => "owl"
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
