#!/usr/bin/env python3

import json
import pathlib
import subprocess

REPOSITORY = "soooooollee/ai-router"
ROOT = pathlib.Path(__file__).resolve().parents[1]
FORMULA = ROOT / "Formula" / "airoute.rb"


def download_text(url: str) -> str:
    return subprocess.check_output(
        [
            "curl",
            "--fail",
            "--silent",
            "--show-error",
            "--location",
            "--http1.1",
            "--retry",
            "3",
            url,
        ],
        text=True,
    )


def latest_release() -> tuple[str, str]:
    metadata = json.loads(download_text(f"https://api.github.com/repos/{REPOSITORY}/releases/latest"))
    tag = metadata["tag_name"]
    return tag, tag.removeprefix("v")


def parse_checksums(contents: str) -> dict[str, str]:
    result = {}
    for line in contents.splitlines():
        parts = line.split()
        if len(parts) == 2:
            result[parts[1].removeprefix("*")] = parts[0]
    return result


def render(tag: str, version: str, checksums: dict[str, str]) -> str:
    targets = {
        "darwin_amd64": f"airoute_{version}_darwin_amd64.tar.gz",
        "darwin_arm64": f"airoute_{version}_darwin_arm64.tar.gz",
        "linux_amd64": f"airoute_{version}_linux_amd64.tar.gz",
        "linux_arm64": f"airoute_{version}_linux_arm64.tar.gz",
    }
    missing = [asset for asset in targets.values() if asset not in checksums]
    if missing:
        raise RuntimeError(f"release is missing checksums for: {', '.join(missing)}")

    def stanza(target: str) -> str:
        asset = targets[target]
        return (
            f'      url "https://github.com/{REPOSITORY}/releases/download/{tag}/{asset}"\n'
            f'      sha256 "{checksums[asset]}"'
        )

    return f'''class Airoute < Formula
  desc "Local-first AI protocol conversion and model routing gateway"
  homepage "https://github.com/{REPOSITORY}"
  version "{version}"
  license "MIT"

  on_macos do
    on_intel do
{stanza("darwin_amd64")}
    end
    on_arm do
{stanza("darwin_arm64")}
    end
  end

  on_linux do
    on_intel do
{stanza("linux_amd64")}
    end
    on_arm do
{stanza("linux_arm64")}
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
    assert_match version.to_s, shell_output("#{{bin}}/air version")
  end
end
'''


def main() -> None:
    tag, version = latest_release()
    checksum_url = f"https://github.com/{REPOSITORY}/releases/download/{tag}/checksums.txt"
    FORMULA.write_text(render(tag, version, parse_checksums(download_text(checksum_url))))


if __name__ == "__main__":
    main()
