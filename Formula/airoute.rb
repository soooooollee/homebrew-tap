class Airoute < Formula
  desc "Local-first AI protocol conversion and model routing gateway"
  homepage "https://github.com/soooooollee/ai-router"
  version "0.2.3"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/soooooollee/ai-router/releases/download/v0.2.3/airoute_0.2.3_darwin_amd64.tar.gz"
      sha256 "eb903d74e420d93f5f8b344f22cab62946c67f2acae1f760289096742afe688b"
    end
    on_arm do
      url "https://github.com/soooooollee/ai-router/releases/download/v0.2.3/airoute_0.2.3_darwin_arm64.tar.gz"
      sha256 "0a6b51bb6aa2b00857b22edc050a5584a315a87003f2c31457728d235cd2a4aa"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/soooooollee/ai-router/releases/download/v0.2.3/airoute_0.2.3_linux_amd64.tar.gz"
      sha256 "82c62ac1c90b4ee36eb563d63623655956785bd362fe5401ed0db708b5d116ff"
    end
    on_arm do
      url "https://github.com/soooooollee/ai-router/releases/download/v0.2.3/airoute_0.2.3_linux_arm64.tar.gz"
      sha256 "6a6249e78ea81cd9099da999b0720fdaee3b9d2136ad40eb6042e5256071f5a2"
    end
  end

  def install
    if File.exist?("air")
      bin.install "air"
    else
      bin.install "airoute" => "air"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/air version")
  end
end
