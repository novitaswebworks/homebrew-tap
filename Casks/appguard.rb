cask "appguard" do
  version "0.5.1"
  sha256 "9fc977130ba9133fa328ae846d81a7a3d0cb6eaa3a1e370c58d9d13e828faa33"

  url "https://github.com/novitaswebworks/appguard/releases/download/v#{version}/AppGuard_#{version}_universal.dmg"

  name "AppGuard"
  desc "Biometric privacy vault & application lock for macOS, Windows, and Linux"
  homepage "https://github.com/novitaswebworks/appguard"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates false
  depends_on macos: :ventura

  app "AppGuard.app"

  zap trash: [
    "~/.config/appguard",
    "~/Library/Application Support/com.appguard.desktop",
    "~/Library/Caches/com.appguard.desktop",
    "~/Library/Preferences/com.appguard.desktop.plist",
    "~/Library/Saved Application State/com.appguard.desktop.savedState",
    "~/Library/LaunchAgents/com.appguard.watchdog.plist",
  ]
end
