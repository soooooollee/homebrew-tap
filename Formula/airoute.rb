class Airoute < Formula
  desc "Local-first AI protocol conversion and model routing gateway"
  homepage "https://github.com/soooooollee/ai-router"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/soooooollee/ai-router/releases/download/v0.3.0/airoute_0.3.0_darwin_amd64.tar.gz"
      sha256 "1e7c0e6e9c67f51054ee45d2b77a8dbc0fd4d937e6fea3a8071b3aae49e7700b"
    end
    on_arm do
      url "https://github.com/soooooollee/ai-router/releases/download/v0.3.0/airoute_0.3.0_darwin_arm64.tar.gz"
      sha256 "8f316a167f441768605dac82a7a64366a5021d1f580c0dbf23d866ebe8f71553"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/soooooollee/ai-router/releases/download/v0.3.0/airoute_0.3.0_linux_amd64.tar.gz"
      sha256 "84d5071436aa0809bf5ea346fe583c165add8516935492253d5d13dc5e05d627"
    end
    on_arm do
      url "https://github.com/soooooollee/ai-router/releases/download/v0.3.0/airoute_0.3.0_linux_arm64.tar.gz"
      sha256 "7bff26328fb5860fc602134c35046fd9589a234ae8cd27cc392196e20b813319"
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
