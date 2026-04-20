class Graphiq < Formula
  desc "Structural code intelligence — unified pipeline with BM25, spectral diffusion, holographic matching"
  homepage "https://github.com/aaf2tbz/graphiq"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/aaf2tbz/graphiq/releases/download/v#{version}/graphiq-aarch64-apple-darwin.tar.gz"
      sha256 "7174e79c97a4ed7e7877c94f562124151d4dd883057a596fa79e02212d9e1ad7"
    end
    on_intel do
      url "https://github.com/aaf2tbz/graphiq/releases/download/v#{version}/graphiq-x86_64-apple-darwin.tar.gz"
      sha256 "0d6cdc07983e5f8b4a38e15924eba97384e99fc10873f5b27cec8b6fe8356bd1"
    end
  end

  on_linux do
    url "https://github.com/aaf2tbz/graphiq/releases/download/v#{version}/graphiq-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "96ffe22dd2d0b4ab98e2ab3464de097e86756c4d2285908c4da5d5d6a877fea5"
  end

  def install
    bin.install "graphiq-aarch64-apple-darwin" => "graphiq"
    bin.install "graphiq-mcp-aarch64-apple-darwin" => "graphiq-mcp"
    bin.install "graphiq-bench-aarch64-apple-darwin" => "graphiq-bench"
  end

  test do
    system "#{bin}/graphiq", "--help"
  end
end
