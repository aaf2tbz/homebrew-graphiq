class Graphiq < Formula
  desc "Structural code intelligence — unified pipeline with BM25, spectral diffusion, holographic matching"
  homepage "https://github.com/aaf2tbz/graphiq"
  version "0.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/aaf2tbz/graphiq/releases/download/v#{version}/graphiq-aarch64-apple-darwin.tar.gz"
      sha256 "3d6ef9f2c777c502488de63aa5132eb414bc41c2c15168622057f1611235a8c3"
    end
    on_intel do
      url "https://github.com/aaf2tbz/graphiq/releases/download/v#{version}/graphiq-x86_64-apple-darwin.tar.gz"
      sha256 "0884c1853e7753ff3d827d135857cefc1ece540d09fe5564ea089206754561aa"
    end
  end

  on_linux do
    url "https://github.com/aaf2tbz/graphiq/releases/download/v#{version}/graphiq-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "02f910c31620fb63fd7da88ed5305bb15ba06636b4d2fd0f38181342a80a81cd"
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
