cask "transcripts" do
  version "1.1.2"
  sha256 "b391177f17bcb621e00dac286a785bd7da7b293510b310e07ac4319fc7dbf5e0"

  url "https://transcripts.doughatcher.com/Transcripts-#{version}.zip"
  name "Transcripts"
  desc "Voice notes and meeting transcripts, recorded and transcribed on-device"
  homepage "https://transcripts.doughatcher.com"

  livecheck do
    url "https://transcripts.doughatcher.com/appcast.json"
    strategy :json do |json|
      json["version"]
    end
  end

  depends_on macos: :sonoma

  app "Transcripts.app"

  zap trash: [
    "~/Library/Application Support/Transcripts",
    "~/Library/Logs/Transcripts.log",
    "~/Library/Preferences/ltd.hatcher.transcripts.plist",
  ]
end
