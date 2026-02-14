cask "claudeagentbar" do
  version "0.1.1"
  sha256 "f15ef37b29c8f5a12f925c71b50b0c0c7e269a8c1a713b2d89462eafbb302188"

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
