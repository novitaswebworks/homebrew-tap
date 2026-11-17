# Homebrew formula for Jobi. It lives in a tap (github.com/novitaswebworks/homebrew-tap, file
# Formula/jobi.rb); this copy is the source of truth. See packaging/homebrew/README.md.
#
# Prebuilt release binaries are used where they exist (small, fast install, no build tools).
# Platforms without one build from source with Rust instead.
class Jobi < Formula
  desc "Local-first job application tracker for your terminal"
  homepage "https://github.com/novitaswebworks/jobi"
  version "0.2.0"
  license "MIT"

  head do
    url "https://github.com/novitaswebworks/jobi.git", branch: "main"
    depends_on "rust" => :build
  end

  on_macos do
    on_arm do
      url "https://github.com/novitaswebworks/jobi/releases/download/v0.2.0/jobi-v0.2.0-macos-arm64.tar.gz"
      sha256 "1cc92fced3f712daa26c5bd125a9a85a7343e98d72204ab3802058a1cc1c18e3"
    end
    on_intel do
      # No prebuilt binary for this platform in v0.2.0: build from source.
      url "https://github.com/novitaswebworks/jobi/archive/refs/tags/v0.2.0.tar.gz"
      sha256 "36a9e6cf06017db26079d4622e8e1c04e6ef50946d6f6ee6dded766718eef20a"
      depends_on "rust" => :build
    end
  end

  on_linux do
    on_arm do
      # No prebuilt binary for this platform in v0.2.0: build from source.
      url "https://github.com/novitaswebworks/jobi/archive/refs/tags/v0.2.0.tar.gz"
      sha256 "36a9e6cf06017db26079d4622e8e1c04e6ef50946d6f6ee6dded766718eef20a"
      depends_on "rust" => :build
    end
    on_intel do
      url "https://github.com/novitaswebworks/jobi/releases/download/v0.2.0/jobi-v0.2.0-linux-x86_64.tar.gz"
      sha256 "1b5ecc34e65b9e2427511b4e494217a2161c1232ab8d1705ad61ebb56df6d906"
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
