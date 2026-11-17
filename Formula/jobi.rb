# Homebrew formula for Jobi. It lives in a tap (github.com/novitaswebworks/homebrew-tap, file
# Formula/jobi.rb); this copy is the source of truth. See packaging/homebrew/README.md.
class Jobi < Formula
  desc "Local-first job application tracker for your terminal"
  homepage "https://github.com/novitaswebworks/jobi"
  url "https://github.com/novitaswebworks/jobi.git",
      tag:      "v0.2.0",
      revision: "07946a87cd6063fdd67f98462f7e45f6052a80d6"
  license "MIT"
  head "https://github.com/novitaswebworks/jobi.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
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
