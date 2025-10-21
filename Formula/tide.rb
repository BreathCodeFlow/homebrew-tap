class Tide < Formula
  desc "🌊 An opinionated macOS maintenance orchestrator with an iocraft-powered interface"
  homepage "https://github.com/BreathCodeFlow/tide"
  version "1.2.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/BreathCodeFlow/tide/releases/download/v#{version}/tide-aarch64-apple-darwin.tar.gz"
      sha256 "cc448eb2be7526977438dc6ddfe15ed467af5fc08e643307178d467ae47e077b"    else
      url "https://github.com/BreathCodeFlow/tide/releases/download/v#{version}/tide-x86_64-apple-darwin.tar.gz"
      sha256 "REPLACE_WITH_ACTUAL_SHA256_FOR_X86_64"
      sha256 "362a9da8e02a31208d455e2c5e9e6259e01dfa5f86e0a9964bab6670996ddd7f"  end

  def install
    bin.install "tide"
  end

  def caveats
    <<~EOS
      To get started with tide:
        tide --init          # Create default config
        tide --list          # List all tasks
        tide                 # Run interactively

      Configuration file: ~/.config/tide/config.toml
    EOS
  end

  test do
    system "#{bin}/tide", "--version"
  end
end
