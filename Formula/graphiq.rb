class Graphiq < Formula
  desc "Structural code intelligence — unified pipeline with BM25, spectral diffusion, holographic matching"
  homepage "https://github.com/aaf2tbz/graphiq"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/aaf2tbz/graphiq/releases/download/v#{version}/graphiq-aarch64-apple-darwin.tar.gz"
      sha256 "48b6c42d500fc1bcf91f96977d08713dac78cd357db7f7cd6b39c8692adb8164"
    end
    on_intel do
      url "https://github.com/aaf2tbz/graphiq/releases/download/v#{version}/graphiq-x86_64-apple-darwin.tar.gz"
      sha256 "725a34ff75070c7b9f0dc38fe08fc9efcf2b29e04bb4b65bdfc3f1e7b540b8e6"
    end
  end

  on_linux do
    url "https://github.com/aaf2tbz/graphiq/releases/download/v#{version}/graphiq-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "ab34b02f942c96d2ec2c407d0dad79b4c93b3addfe8d9e46b43a4365e9603079"
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
