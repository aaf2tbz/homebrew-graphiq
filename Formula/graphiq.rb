class Graphiq < Formula
  desc "Structural code intelligence — unified pipeline with BM25, spectral diffusion, holographic matching"
  homepage "https://github.com/aaf2tbz/graphiq"
  version "0.4.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/aaf2tbz/graphiq/releases/download/v#{version}/graphiq-aarch64-apple-darwin.tar.gz"
      sha256 "09c314064667fcbac3eae9825c32722a25f52ddd666e2c556847460360c0f20e"
    end
    on_intel do
      url "https://github.com/aaf2tbz/graphiq/releases/download/v#{version}/graphiq-x86_64-apple-darwin.tar.gz"
      sha256 "b9334dc42fb842c0bad1ce2afd376614992497423c8ae5952969764b8899aa88"
    end
  end

  on_linux do
    url "https://github.com/aaf2tbz/graphiq/releases/download/v#{version}/graphiq-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "6b9c0997b3c867396f58b0d2931085dea799c50a22618587ed322560b06c4ad3"
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
