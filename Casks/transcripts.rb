cask "transcripts" do
  version "1.0.5"
  sha256 "83fb5c2a780af7646fcc7fff0bf2d7eba7020904b4f002f92c54e82f91714d62"

  url "https://transcripts.hatcher.ltd/Transcripts-#{version}.zip"
  name "Transcripts"
  desc "Voice notes and meeting transcripts, recorded and transcribed on-device"
  homepage "https://transcripts.hatcher.ltd"

  livecheck do
    url "https://transcripts.hatcher.ltd/appcast.json"
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
