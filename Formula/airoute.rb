class Airoute < Formula
  desc "Local-first AI protocol conversion and model routing gateway"
  homepage "https://github.com/soooooollee/ai-router"
  version "0.2.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/soooooollee/ai-router/releases/download/v0.2.1/airoute_0.2.1_darwin_amd64.tar.gz"
      sha256 "d5bbc983253a3d5ac9e0c99b2ab4fc849a1bd07b05db58de2fc111e371403916"
    end
    on_arm do
      url "https://github.com/soooooollee/ai-router/releases/download/v0.2.1/airoute_0.2.1_darwin_arm64.tar.gz"
      sha256 "411a07a0f9be926865fae2e723cf0ed983c68320cd9b6e28a4d9ed99387a8482"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/soooooollee/ai-router/releases/download/v0.2.1/airoute_0.2.1_linux_amd64.tar.gz"
      sha256 "1c32b3a48cb294eaaa5ed0ec2d2c227f9815e2138cae4b75cafb0e8ecccf7bfe"
    end
    on_arm do
      url "https://github.com/soooooollee/ai-router/releases/download/v0.2.1/airoute_0.2.1_linux_arm64.tar.gz"
      sha256 "728945cfc1bad53c8a8a09cfb3fbd0adc1b86ef5dbc95a209856c1d13faa8962"
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
