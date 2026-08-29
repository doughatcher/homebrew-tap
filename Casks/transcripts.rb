cask "transcripts" do
  version "1.0.1"
  sha256 "1e11525c0709c8942bfae32df62f027ed071e0335512724487889a4c3645e553"

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
