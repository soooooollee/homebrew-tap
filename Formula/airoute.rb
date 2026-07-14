class Airoute < Formula
  desc "Local-first AI protocol conversion and model routing gateway"
  homepage "https://github.com/soooooollee/ai-router"
  version "0.2.4"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/soooooollee/ai-router/releases/download/v0.2.4/airoute_0.2.4_darwin_amd64.tar.gz"
      sha256 "d36cc2470cf0f0b420eaa9226cf03c02390760f8d0c309babf9e4d3626dac087"
    end
    on_arm do
      url "https://github.com/soooooollee/ai-router/releases/download/v0.2.4/airoute_0.2.4_darwin_arm64.tar.gz"
      sha256 "d80b3ff60d56a82ebeae5180aa176b4d92b6ee8e8012e078ee63e108128c2fe7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/soooooollee/ai-router/releases/download/v0.2.4/airoute_0.2.4_linux_amd64.tar.gz"
      sha256 "d02de58ad7cf58c0ce7c053379d61e39c9ec521675a776adddb2bb218ca98df9"
    end
    on_arm do
      url "https://github.com/soooooollee/ai-router/releases/download/v0.2.4/airoute_0.2.4_linux_arm64.tar.gz"
      sha256 "4a22e3b374384d356d0ae334603c54d1ff2b3530d041bf5a34dfb892e557b7bf"
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
