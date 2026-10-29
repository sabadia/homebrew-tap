cask "dlm-app" do
  version "0.1.0"
  sha256 "907d98323fbec35f7fec5efbb2275e97a202a8a2d6ec6d9a474aa596107a6622"

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
    "~/Library/Application Support/dlm",
    "~/Library/Caches/io.github.sabadia.dlm",
    "~/Library/Preferences/io.github.sabadia.dlm.plist",
    "~/Library/Saved Application State/io.github.sabadia.dlm.savedState",
  ]
end
