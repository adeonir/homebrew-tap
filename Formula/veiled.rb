class Veiled < Formula
  desc "A macOS CLI to automatically exclude development artifacts from Time Machine backups"
  homepage "https://github.com/adeonir/veiled"
  version "0.0.9"
  license "MIT"

  on_arm do
    url "https://github.com/adeonir/veiled/releases/download/v#{version}/veiled-macos-arm64"
    sha256 "13bf3c0775902778ae781844d015e1fd752a1d0e1a1b2fa73cb8f7ff929a24e5"
  end

  on_intel do
    url "https://github.com/adeonir/veiled/releases/download/v#{version}/veiled-macos-x64"
    sha256 "4ec0ce487636af0332d5df7571bdfa07517b5bbe7a105d49582095dc6798c801"
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
