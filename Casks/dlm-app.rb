cask "dlm-app" do
  version "0.4.1"
  sha256 "90f05afb1a51908ef756116109e3b6ddecb537456d2eaaa2e0d3a85c59825d72"

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

  # The registrations point into the app, so they go with it (not only with
  # `--zap`): a browser must not keep starting a helper that is gone.
  uninstall quit:   "io.github.sabadia.dlm",
            delete: [
              "~/Library/Application Support/BraveSoftware/Brave-Browser/NativeMessagingHosts/dev.sabadia.dlm.json",
              "~/Library/Application Support/Chromium/NativeMessagingHosts/dev.sabadia.dlm.json",
              "~/Library/Application Support/Google/Chrome/NativeMessagingHosts/dev.sabadia.dlm.json",
              "~/Library/Application Support/Microsoft Edge/NativeMessagingHosts/dev.sabadia.dlm.json",
              "~/Library/Application Support/Mozilla/NativeMessagingHosts/dev.sabadia.dlm.json",
            ]

  zap trash: [
    "~/Library/Application Support/dlm",
    "~/Library/Caches/io.github.sabadia.dlm",
    "~/Library/Preferences/io.github.sabadia.dlm.plist",
    "~/Library/Saved Application State/io.github.sabadia.dlm.savedState",
  ]
end
