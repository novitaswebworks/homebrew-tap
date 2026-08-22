class ProcManager < Formula
  desc "Modern TUI Process, Docker, and Service Manager"
  homepage "https://github.com/novitaswebworks/proc-manager"
  version "1.0.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/novitaswebworks/proc-manager/releases/download/v1.0.1/proc-manager-macos-arm64.tar.gz"
      sha256 "03a54f22d3a87a938c48b7488a6fcd30e1c348d8e2faec1336236fb79cce56e4"
    else
      url "https://github.com/novitaswebworks/proc-manager/releases/download/v1.0.1/proc-manager-macos-x86_64.tar.gz"
      sha256 "0525bcd02679cac1f983b1613ff17b5ca49c2c66a16b708c5c332bcb41d3e4c7"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/novitaswebworks/proc-manager/releases/download/v1.0.1/proc-manager-linux-x86_64.tar.gz"
      sha256 "9511d05e2f6b3c2d8695063d1b9e87f879c9acd7c5e56738c9402f57adbb6765"
    end
  end

  def install
    bin.install "proc-manager"
  end

  test do
    system "#{bin}/proc-manager", "--version"
  end
end
