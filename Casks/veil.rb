cask "veil" do
  version "1.0.3"
  sha256 "ca26e3712fce0275dc3fa8d458a9a2db2ce865e5ba97031fdc915743a6d8b3db"

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
