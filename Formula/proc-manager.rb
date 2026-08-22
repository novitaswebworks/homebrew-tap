class ProcManager < Formula
  desc "Modern TUI Process, Docker, and Service Manager"
  homepage "https://github.com/novitaswebworks/proc-manager"
  version "1.3.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/novitaswebworks/proc-manager/releases/download/v1.3.0/proc-manager-macos-arm64.tar.gz"
      sha256 "e74be9d41feb7cd39615ac0a1911781544467fec70bb0ff8653fd2f449a32cd6"
    else
      url "https://github.com/novitaswebworks/proc-manager/releases/download/v1.3.0/proc-manager-macos-x86_64.tar.gz"
      sha256 "a0f86730be262d1b4d43955ce4510982b4091d9d22aa7e3ad54718a9a146d146"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/novitaswebworks/proc-manager/releases/download/v1.3.0/proc-manager-linux-x86_64.tar.gz"
      sha256 "5eaeeb5a8a310e4596fd0797cd06cc29086433ea4024ac953f7f3c06fc50bb57"
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
