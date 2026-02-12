cask "claudeagentbar" do
  version "1.0"
  sha256 "PLACEHOLDER"

  url "https://github.com/artemnovichkov/ClaudeAgentBar/releases/download/v#{version}/ClaudeAgentBar.zip",
      verified: "github.com/artemnovichkov/ClaudeAgentBar/"
  name "ClaudeAgentBar"
  desc "Menu bar app for tracking Claude Agent stats from Xcode"
  homepage "https://github.com/artemnovichkov/ClaudeAgentBar"

  depends_on macos: ">= :sequoia"
  depends_on arch: :arm64

  app "ClaudeAgentBar.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/ClaudeAgentBar.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Preferences/com.artemnovichkov.ClaudeAgentBar.plist",
    "~/Library/Caches/com.artemnovichkov.ClaudeAgentBar",
  ]
end
