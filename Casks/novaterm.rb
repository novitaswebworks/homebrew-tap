cask "novaterm" do
  version "2.1.0"
  sha256 "bb6f4c7f3dc3a2b64776235b4abf2e75006c9f9110336d32a426a6bb0455d867"

  url "https://github.com/novitaswebworks/novaterm/releases/download/v#{version}/NovaTerm_#{version}_universal.dmg"

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
