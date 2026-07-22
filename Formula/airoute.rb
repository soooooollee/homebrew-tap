class Airoute < Formula
  desc "Local-first AI protocol conversion and model routing gateway"
  homepage "https://github.com/soooooollee/ai-router"
  version "0.2.6"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/soooooollee/ai-router/releases/download/v0.2.6/airoute_0.2.6_darwin_amd64.tar.gz"
      sha256 "9a7a4f186187ae79ec64eda30af7165a5fdc4a34f02c8583780a88d2b291d205"
    end
    on_arm do
      url "https://github.com/soooooollee/ai-router/releases/download/v0.2.6/airoute_0.2.6_darwin_arm64.tar.gz"
      sha256 "ba8e9d9a374bfef6ce69abb4501166e4bb604493f97e1d7467f428e77a08b3eb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/soooooollee/ai-router/releases/download/v0.2.6/airoute_0.2.6_linux_amd64.tar.gz"
      sha256 "2eec6c2c7e4fbfeab9c4a3bb7dc72524b84ce9712d26022667cb2f5af75907be"
    end
    on_arm do
      url "https://github.com/soooooollee/ai-router/releases/download/v0.2.6/airoute_0.2.6_linux_arm64.tar.gz"
      sha256 "f0ca504fd92f1b35692484301cf670b5a5bbb6473b04d167000ec946a0af4f8b"
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
