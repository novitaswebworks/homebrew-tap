cask "novaterm" do
  version "2.0.2"
  sha256 "c00b8516f303b91d84c74e5ba6e6334fb9c026397c576306fcd45e7eb0ef707c"

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
