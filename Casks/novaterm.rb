cask "novaterm" do
  version "1.3.1"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"

  url "https://github.com/novitaswebworks/novaterm/releases/download/v#{version}/NovaTerm_#{version}_aarch64.dmg",
      verified: "github.com/novitaswebworks/novaterm/"

  name "NovaTerm"
  desc "AI-native terminal with built-in editor, local AI inference, and ghost-text predictions"
  homepage "https://novaterm.novitasweb.works"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates false
  depends_on macos: ">= :ventura"

  app "NovaTerm.app"

  zap trash: [
    "~/Library/Application Support/com.novitaswebworks.novaterm",
    "~/Library/Caches/com.novitaswebworks.novaterm",
    "~/Library/Logs/NovaTerm",
    "~/Library/Preferences/com.novitaswebworks.novaterm.plist",
    "~/Library/Saved Application State/com.novitaswebworks.novaterm.savedState",
  ]
end
