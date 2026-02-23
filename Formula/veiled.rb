class Veiled < Formula
  desc "A macOS CLI to automatically exclude development artifacts from Time Machine backups"
  homepage "https://github.com/adeonir/veiled"
  version "0.0.6"
  license "MIT"

  on_arm do
    url "https://github.com/adeonir/veiled/releases/download/v#{version}/veiled-macos-arm64"
    sha256 "a87b3b375539efeba7c9f670373bfbad49fd136782ae48546d646bf8fbe4d689"
  end

  on_intel do
    url "https://github.com/adeonir/veiled/releases/download/v#{version}/veiled-macos-x64"
    sha256 "37d6fda79a1d1d7f99394ba9cd5ecbc6e48221d2316b5508ac17c6712db35c0b"
  end

  def install
    if Hardware::CPU.arm?
      bin.install "veiled-macos-arm64" => "veiled"
    else
      bin.install "veiled-macos-x64" => "veiled"
    end
  end

  test do
    system bin/"veiled", "--version"
  end
end
