class Airoute < Formula
  desc "Local-first AI protocol conversion and model routing gateway"
  homepage "https://github.com/soooooollee/ai-router"
  version "0.2.2"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/soooooollee/ai-router/releases/download/v0.2.2/airoute_0.2.2_darwin_amd64.tar.gz"
      sha256 "54f06d9034886e7625f1fe0f7d603f9df40c965f438a7fd436f17f392ed65ac2"
    end
    on_arm do
      url "https://github.com/soooooollee/ai-router/releases/download/v0.2.2/airoute_0.2.2_darwin_arm64.tar.gz"
      sha256 "5d005e9c4f40a135b83a6ccbfbb3dcf590356a5f59b98bc99ab6a7eefe77231f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/soooooollee/ai-router/releases/download/v0.2.2/airoute_0.2.2_linux_amd64.tar.gz"
      sha256 "7d243fb0b5aef05d2182f3264036d2cb4ce4ca6a766727d2a41a99c3037c0035"
    end
    on_arm do
      url "https://github.com/soooooollee/ai-router/releases/download/v0.2.2/airoute_0.2.2_linux_arm64.tar.gz"
      sha256 "f7f6c1e966c7ff92a3ab349459fdab12fce79336ddfa4d8c39ec4054284fcc34"
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
