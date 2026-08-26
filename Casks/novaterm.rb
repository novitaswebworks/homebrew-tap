cask "novaterm" do
  version "1.3.6"
  sha256 "7509841b624dbeeebc3ca1d625928f070aa8990ce7dd6bb15d06ea18c3744708"

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
