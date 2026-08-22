class ProcManager < Formula
  desc "Modern TUI Process, Docker, and Service Manager"
  homepage "https://github.com/novitaswebworks/proc-manager"
  version "1.2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/novitaswebworks/proc-manager/releases/download/1.2.0/proc-manager-macos-arm64.tar.gz"
      sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
    else
      url "https://github.com/novitaswebworks/proc-manager/releases/download/1.2.0/proc-manager-macos-x86_64.tar.gz"
      sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/novitaswebworks/proc-manager/releases/download/1.2.0/proc-manager-linux-x86_64.tar.gz"
      sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
    end
  end

  def install
    bin.install "proc-manager"
    bin.install_symlink "proc-manager" => "nman"
  end

  test do
    system "#{bin}/proc-manager", "--version"
  end
end
