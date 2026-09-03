cask "transcripts" do
  version "1.1.0-beta.7"
  sha256 "069777091f6bc7afc2bbdf1d9fd9284151443cf88a85da72f044efcaaf5ab738"

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
