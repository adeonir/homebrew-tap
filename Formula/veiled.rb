class Veiled < Formula
  desc "A macOS CLI to automatically exclude development artifacts from Time Machine backups"
  homepage "https://github.com/adeonir/veiled"
  version "0.0.1"
  license "MIT"

  on_arm do
    url "https://github.com/adeonir/veiled/releases/download/v#{version}/veiled-macos-arm64"
    sha256 "ARM64_SHA256"
  end

  on_intel do
    url "https://github.com/adeonir/veiled/releases/download/v#{version}/veiled-macos-x64"
    sha256 "X64_SHA256"
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
