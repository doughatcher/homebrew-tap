cask "transcripts" do
  version "1.1.1"
  sha256 "42f04e32e57715dd38e575a23b0680a705a698e60c44bd6541409ec362bdec73"

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
