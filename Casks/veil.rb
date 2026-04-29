cask "veil" do
  version "1.0.5"
  sha256 "61501efd84f009bf47c4778863e907f322f89ef2c853381187aeb5aee642a10f"

  url "https://github.com/zlahham/Veil/releases/download/v#{version}/Veil.zip"
  name "Veil"
  desc "Lightweight macOS menu bar manager"
  homepage "https://github.com/zlahham/Veil"

  depends_on macos: ">= :sonoma"
  depends_on arch: :arm64

  app "Veil.app"

  # Veil ships with an ad-hoc signature (no Apple Developer ID notarization).
  # Strip the quarantine attribute on install so macOS doesn't block the first launch.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Veil.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Preferences/com.veil.app.plist",
    "~/Library/Application Support/Veil",
    "~/Library/Caches/com.veil.app",
  ]
end
