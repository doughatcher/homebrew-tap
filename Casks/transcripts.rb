cask "transcripts" do
  version "1.1.0-beta.9"
  sha256 "4869ca8ee01c0b13a45fb19d8713200ad1d13efbbeccfc01196a9cc6fec699e6"

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
