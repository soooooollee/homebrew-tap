class Airoute < Formula
  desc "Local-first AI protocol conversion and model routing gateway"
  homepage "https://github.com/soooooollee/ai-router"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/soooooollee/ai-router/releases/download/v0.2.0/airoute_0.2.0_darwin_amd64.tar.gz"
      sha256 "909f5a31860d16908da93e6a26d60d2c878e553536e32d01577896429a6c534e"
    end
    on_arm do
      url "https://github.com/soooooollee/ai-router/releases/download/v0.2.0/airoute_0.2.0_darwin_arm64.tar.gz"
      sha256 "6ec16915b8f766de35b8eacca0baa56de8b38dbcc75093f0028cefed07659702"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/soooooollee/ai-router/releases/download/v0.2.0/airoute_0.2.0_linux_amd64.tar.gz"
      sha256 "deceb118f08a7574427081e6c3cef0adf3cc361968c9fcbe4b18a450c1136d08"
    end
    on_arm do
      url "https://github.com/soooooollee/ai-router/releases/download/v0.2.0/airoute_0.2.0_linux_arm64.tar.gz"
      sha256 "abd07cf8c46083e6e6e1b324fe08a8f9b7d239756e8feb657daa153f96421ceb"
    end
  end

  def install
    bin.install "airoute"
  end

  test do
    assert_match "airoute #{version}", shell_output("#{bin}/airoute version")
  end
end
