cask "curtain" do
  version "1.0.43"
  sha256 "889ad57e4a54ee69093b57d1f3bf8c46c6f8869707599eefe287113434de84e5"

  url "https://github.com/box-kr/curtain/releases/download/v#{version}/Curtain-#{version}.zip"
  name "Curtain"
  desc "macOS Menu Bar Utility for Screen Privacy during remote connections"
  homepage "https://github.com/box-kr/curtain"

  app "Curtain.app"

  # 다운로드 후 Gatekeeper에서 '손상된 앱'으로 인식되는 것을 방지합니다.
  postflight do
    system_command "xattr",
                   args: ["-cr", "#{appdir}/Curtain.app"],
                   sudo: false,
                   must_succeed: false
  end

  zap trash: [
    "~/Library/Preferences/kr.box.funbox.macos.curtain.plist",
  ]
end
