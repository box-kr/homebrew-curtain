cask "curtain" do
  version "1.0.24"
  sha256 "ba609290f99adae70c7cccf5277a6dadcaaea95bf3558461e7a3dc2c7607a694"

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
