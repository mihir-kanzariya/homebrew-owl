class Owl < Formula
  desc "AI desktop automation MCP server — give your AI eyes and hands"
  homepage "https://openowl-portal.vercel.app"
  version "0.3.1"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://dedjlsvrwafhyznaazbm.supabase.co/storage/v1/object/public/releases/v0.3.1/owl-darwin-arm64.tar.gz"
      sha256 "99fa782c6ade3cda62ab70574450209432fa681c4cf99807d9e5a66b6f13f401"

      def install
        libexec.install Dir["*"]
        bin.install_symlink libexec/"owl-darwin-arm64" => "owl"
      end
    end

    on_intel do
      url "https://dedjlsvrwafhyznaazbm.supabase.co/storage/v1/object/public/releases/v0.3.1/owl-darwin-x64.tar.gz"
      sha256 "7926bf35ca74ec3821affcfac330367ff18a52d1f58867d6a31932d7cdcece7e"

      def install
        libexec.install Dir["*"]
        bin.install_symlink libexec/"owl-darwin-x86_64" => "owl"
      end
    end
  end

  def caveats
    <<~EOS
      To use OpenOwl, you need an API key:
        1. Sign up at https://openowl-portal.vercel.app/quick-setup
        2. Your key is generated automatically on signup
        3. Save it:
 mkdir -p ~/.openowl
 echo "owl-xxxx-xxxx-xxxx" > ~/.openowl/api.key

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
