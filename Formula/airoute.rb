class Airoute < Formula
  desc "Local-first AI protocol conversion and model routing gateway"
  homepage "https://github.com/soooooollee/ai-router"
  version "0.2.5"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/soooooollee/ai-router/releases/download/v0.2.5/airoute_0.2.5_darwin_amd64.tar.gz"
      sha256 "4b02ace6401ba96b7e45957906dbf5bc4962c70ecc9182cc371772dc3b7232be"
    end
    on_arm do
      url "https://github.com/soooooollee/ai-router/releases/download/v0.2.5/airoute_0.2.5_darwin_arm64.tar.gz"
      sha256 "0fa2328282af8419025a16111b37fab12c2c8813c8268df3e40ba6c9c325d4e2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/soooooollee/ai-router/releases/download/v0.2.5/airoute_0.2.5_linux_amd64.tar.gz"
      sha256 "0312e939fd5a6f76e3fcf0aafb3bba981f3e6ceba256fd49907578e8da493704"
    end
    on_arm do
      url "https://github.com/soooooollee/ai-router/releases/download/v0.2.5/airoute_0.2.5_linux_arm64.tar.gz"
      sha256 "334492082ad0ae97af5f9f28467051560a0d2fc93acdb9342b23654807b1782f"
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
