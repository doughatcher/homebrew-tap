cask "transcripts" do
  version "1.1.0-beta.10"
  sha256 "9d99a1eeb4d0eda29d61a2214d3ff59e26c873bb81dddea12574b7af94d559a9"

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
