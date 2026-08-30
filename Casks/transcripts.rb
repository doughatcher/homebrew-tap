cask "transcripts" do
  version "1.0.6"
  sha256 "9d187677d2c0830657f74255340044265af683f8576befead5cdcb246f93e936"

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
