cask "novaterm" do
  version "1.3.1"
  sha256 "d837c4ed68874f0d27c0d0d65c59096c99d674239805acd73047536a44430aee"

  url "https://github.com/novitaswebworks/novaterm/releases/download/v#{version}/NovaTerm_#{version}_universal.dmg",
      verified: "github.com/novitaswebworks/novaterm/"

  name "NovaTerm"
  desc "AI-native terminal with built-in editor, local AI inference, and ghost-text predictions"
  homepage "https://novaterm.novitasweb.works"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates false
  depends_on macos: :ventura

  app "NovaTerm.app"

  zap trash: [
    "~/Library/Application Support/com.novitaswebworks.novaterm",
    "~/Library/Caches/com.novitaswebworks.novaterm",
    "~/Library/Logs/NovaTerm",
    "~/Library/Preferences/com.novitaswebworks.novaterm.plist",
    "~/Library/Saved Application State/com.novitaswebworks.novaterm.savedState",
  ]
end
