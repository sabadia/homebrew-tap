cask "dlm-app" do
  version "0.2.1"
  sha256 "c5b41fc40910546b06f92309d2b3e297cc9aa933d68fab2631382fd10e72c65e"

  url "https://github.com/sabadia/dlm-app/releases/download/v#{version}/DLM_#{version}.dmg"
  name "DLM"
  desc "Cross-platform download manager"
  homepage "https://github.com/sabadia/dlm-app"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "DLM.app"

  uninstall quit: "io.github.sabadia.dlm"

  zap trash: [
    "~/Library/Application Support/BraveSoftware/Brave-Browser/NativeMessagingHosts/dev.sabadia.dlm.json",
    "~/Library/Application Support/Chromium/NativeMessagingHosts/dev.sabadia.dlm.json",
    "~/Library/Application Support/dlm",
    "~/Library/Application Support/Google/Chrome/NativeMessagingHosts/dev.sabadia.dlm.json",
    "~/Library/Application Support/Microsoft Edge/NativeMessagingHosts/dev.sabadia.dlm.json",
    "~/Library/Application Support/Mozilla/NativeMessagingHosts/dev.sabadia.dlm.json",
    "~/Library/Caches/io.github.sabadia.dlm",
    "~/Library/Preferences/io.github.sabadia.dlm.plist",
    "~/Library/Saved Application State/io.github.sabadia.dlm.savedState",
  ]
end
