cask "appguard" do
  version "0.5.0"
  sha256 "4a057c9fa528c8ae5af8084ebe1520c6bef79791d4e9f27552f123373f9d7365"

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
