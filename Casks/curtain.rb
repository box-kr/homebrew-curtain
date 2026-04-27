cask "curtain" do
  version "1.0.19"
  sha256 "ee6fad936e8b8533f07a6f77cdc0530367ff545974f082b3a5ada61014db80f7"

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
