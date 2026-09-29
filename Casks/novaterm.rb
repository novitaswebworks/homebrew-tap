cask "novaterm" do
  version "2.0.0"
  sha256 "c5e38ba93e62501f8d46935d8c2059567436a7ab4f049b62d92454ae2ab17dcd"

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
