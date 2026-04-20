class Graphiq < Formula
  desc "Structural code intelligence — unified pipeline with BM25, spectral diffusion, holographic matching"
  homepage "https://github.com/aaf2tbz/graphiq"
  version "4.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/aaf2tbz/graphiq/releases/download/v#{version}/graphiq-aarch64-apple-darwin.tar.gz"
      sha256 "4abd2f14a04909366ea28f19eb6632c8304268f2673b4bc863158d5606bab5d1"
    end
    on_intel do
      url "https://github.com/aaf2tbz/graphiq/releases/download/v#{version}/graphiq-x86_64-apple-darwin.tar.gz"
      sha256 "fe562660da15543b430180e91aee90138d9db0a188b3701096db1acde016440b"
    end
  end

  on_linux do
    url "https://github.com/aaf2tbz/graphiq/releases/download/v#{version}/graphiq-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "a5c38ec34a0d27530130b6c9f2d456c131e985b827fff90aab530035c793bb15"
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
