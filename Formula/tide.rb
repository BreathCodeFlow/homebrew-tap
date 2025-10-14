class Tide < Formula
  desc "🌊 An opinionated macOS maintenance orchestrator with an iocraft-powered interface"
  homepage "https://github.com/BreathCodeFlow/tide"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/BreathCodeFlow/tide/releases/download/v#{version}/tide-aarch64-apple-darwin.tar.gz"
      sha256 "1962d1a76a662cc2f915702499f2377a1efe7f2fd317ace1beddf12d76749bfc"
    else
      url "https://github.com/BreathCodeFlow/tide/releases/download/v#{version}/tide-x86_64-apple-darwin.tar.gz"
      sha256 "f148dba083840c1f988c0fafdbd6e9d3584bbe20c3b037d7ae510f3b80d4ebf6"
    end
  end

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
