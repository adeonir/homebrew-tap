class Veiled < Formula
  desc "A macOS CLI to automatically exclude development artifacts from Time Machine backups"
  homepage "https://github.com/adeonir/veiled"
  version "0.0.11"
  license "MIT"

  on_arm do
    url "https://github.com/adeonir/veiled/releases/download/v#{version}/veiled-macos-arm64"
    sha256 "b8615c9baad1b7ec39fe31c1c39bb4d96188e6d2db80ba024a98d102ead4cc48"
  end

  on_intel do
    url "https://github.com/adeonir/veiled/releases/download/v#{version}/veiled-macos-x64"
    sha256 "4d9d24ab8fc66613b832803efdf6c2ad268348cb492ae4bd489bfeeefb78f6de"
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
