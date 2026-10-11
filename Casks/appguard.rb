cask "appguard" do
  version "0.6.0"
  sha256 "f3bcc7099daf0eaea9be2d245011e7d98bf85a53baaefb1c36a070104c4a66aa"

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
