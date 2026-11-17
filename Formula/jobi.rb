# Homebrew formula for Jobi. It lives in a tap (github.com/novitaswebworks/homebrew-tap, file
# Formula/jobi.rb); this copy is the source of truth. See packaging/homebrew/README.md.
#
# Prebuilt release binaries are used where they exist (small, fast install, no build tools).
# Linux arm64 has none yet and builds from source with Rust instead.
class Jobi < Formula
  desc "Local-first job application tracker for your terminal"
  homepage "https://github.com/novitaswebworks/jobi"
  license "MIT"

  head do
    url "https://github.com/novitaswebworks/jobi.git", branch: "main"
    depends_on "rust" => :build
  end

  on_macos do
    on_arm do
      url "https://github.com/novitaswebworks/jobi/releases/download/v0.3.0/jobi-v0.3.0-macos-arm64.tar.gz"
      sha256 "d0864e4b6aff6f1b67017c912984b97c0bc5260b180b3f4e2cdcad7efa495554"
    end
    on_intel do
      url "https://github.com/novitaswebworks/jobi/releases/download/v0.3.0/jobi-v0.3.0-macos-x86_64.tar.gz"
      sha256 "86cdf55be050a8e821144a9ef2f0c0545cef594df17a5fe48263afb7c9a0af87"
    end
  end

  on_linux do
    on_arm do
      # No prebuilt binary for this platform yet: build from source.
      url "https://github.com/novitaswebworks/jobi/archive/refs/tags/v0.3.0.tar.gz"
      sha256 "ead3d184de55719f7bf2332a218cc3ae58a3eb6b420a0f5877ba7377ebabdcca"
      depends_on "rust" => :build
    end
    on_intel do
      url "https://github.com/novitaswebworks/jobi/releases/download/v0.3.0/jobi-v0.3.0-linux-x86_64.tar.gz"
      sha256 "4a92164e181abb70e82aeeba3d3e3b2138dc768f92b2457e8bbe8506b34445ba"
    end
  end

  def install
    if (buildpath/"Cargo.toml").exist?
      system "cargo", "install", *std_cargo_args
    else
      bin.install "jobi"
    end
    generate_completions_from_executable(bin/"jobi", "completions")
    (man1/"jobi.1").write Utils.safe_popen_read(bin/"jobi", "man")
  end

  test do
    ENV["JOBI_DB"] = (testpath/"jobi.sqlite3").to_s
    ENV["JOBI_CONFIG"] = (testpath/"none.toml").to_s
    assert_match version.to_s, shell_output("#{bin}/jobi --version")
    system bin/"jobi", "add", "--company", "Acme", "--role", "Engineer"
    assert_match "Acme", shell_output("#{bin}/jobi list")
    assert_match "1 open", shell_output("#{bin}/jobi status")
  end
end
