class Veiled < Formula
  desc "A macOS CLI to automatically exclude development artifacts from Time Machine backups"
  homepage "https://github.com/adeonir/veiled"
  version "0.0.2"
  license "MIT"

  on_arm do
    url "https://github.com/adeonir/veiled/releases/download/v#{version}/veiled-macos-arm64"
    sha256 "d106992834359fb367c23779bd92207244c020fca1bafab46b1d3a710718ce3c"
  end

  on_intel do
    url "https://github.com/adeonir/veiled/releases/download/v#{version}/veiled-macos-x64"
    sha256 "a3ee5dec944b2ac1c2a012f3e0ef27f293f58423611ea5b9457ee17371175ba4"
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
