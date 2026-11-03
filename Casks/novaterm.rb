cask "novaterm" do
  version "2.2.1"
  sha256 "e4ecb96d01ab983102701c665453a6a18c0af676d4976cfd7b4340840fb84125"

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
