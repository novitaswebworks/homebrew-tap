cask "novaterm" do
  version "1.4.0"
  sha256 "5c4a852d73f760250461be86915c44e7dc7ef0a521920a4bf68dcf9c8c21d5bd"

  url "https://github.com/lordbobby-dot/novaterm/releases/download/v#{version}/NovaTerm_#{version}_universal.dmg",
      verified: "github.com/lordbobby-dot/novaterm/"

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
