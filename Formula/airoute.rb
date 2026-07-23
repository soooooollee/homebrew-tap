class Airoute < Formula
  desc "Local-first AI protocol conversion and model routing gateway"
  homepage "https://github.com/soooooollee/ai-router"
  version "0.3.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/soooooollee/ai-router/releases/download/v0.3.1/airoute_0.3.1_darwin_amd64.tar.gz"
      sha256 "dc44492c97c0790ed56b47a91d2cd4824e68d27c8e6b12bc9bab4ab19dc1259e"
    end
    on_arm do
      url "https://github.com/soooooollee/ai-router/releases/download/v0.3.1/airoute_0.3.1_darwin_arm64.tar.gz"
      sha256 "6c2c78d20a3b80c09cbf2e12238b1cc224bc5de9a445a56a8bbbd3c4ceabd767"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/soooooollee/ai-router/releases/download/v0.3.1/airoute_0.3.1_linux_amd64.tar.gz"
      sha256 "fed036ad108622f9a3693fdbcae722590bc1de081341f91720c3f4ea9e7f8c50"
    end
    on_arm do
      url "https://github.com/soooooollee/ai-router/releases/download/v0.3.1/airoute_0.3.1_linux_arm64.tar.gz"
      sha256 "33290cf35037a63297eedecbc3eb5ac6edd7f226daecc672ff89c0247a3e9f99"
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
