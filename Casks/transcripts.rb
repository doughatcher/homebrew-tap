cask "transcripts" do
  version "1.1.0-beta.3"
  sha256 "7f7b9e7dd5ca46a28133a4b815e333f60ce2e929636d1cfd497da0268a1d9ba2"

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
