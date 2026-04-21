class Graphiq < Formula
  desc "Structural code intelligence — BM25 + graph walk search, blast radius, structural context"
  homepage "https://github.com/aaf2tbz/graphiq"
  version "3.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/aaf2tbz/graphiq/releases/download/v#{version}/graphiq-aarch64-apple-darwin.tar.gz"
      sha256 "7c961a89827d9254381b5eaf23bc818a16feef15355665c9fdf4b716a157c25f"
    end
    on_intel do
      url "https://github.com/aaf2tbz/graphiq/releases/download/v#{version}/graphiq-x86_64-apple-darwin.tar.gz"
      sha256 "5de36997cd5ec7635b11695a1a04f5aadaecd0bdac5ff83a987a1b8a7eb9edf4"
    end
  end

  on_linux do
    url "https://github.com/aaf2tbz/graphiq/releases/download/v#{version}/graphiq-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "a673ea5b2229f6e66bd2e31815573488378522633f585f8dca36a1387df2c75d"
  end

  def install
    bin.install "graphiq"
    bin.install "graphiq-mcp"
    bin.install "graphiq-bench"
  end

  test do
    system "#{bin}/graphiq", "--help"
  end
end
