class Graphiq < Formula
  desc "Structural code intelligence — BM25 + graph walk search, blast radius, structural context"
  homepage "https://github.com/aaf2tbz/graphiq"
  version "3.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/aaf2tbz/graphiq/releases/download/v#{version}/graphiq-aarch64-apple-darwin.tar.gz"
      sha256 "5109f5d35d2e9a624a34359f1142d25a48b678b7b3e6b5b8c50984e4fcfa307c"
    end
    on_intel do
      url "https://github.com/aaf2tbz/graphiq/releases/download/v#{version}/graphiq-x86_64-apple-darwin.tar.gz"
      sha256 "5c5214ba5474a9b3b60fe488805c723e8a7a23e127e1e4cceb297b037cd62f89"
    end
  end

  on_linux do
    url "https://github.com/aaf2tbz/graphiq/releases/download/v#{version}/graphiq-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "75760a09143e6b91cb0025dbd6be01f6c2d8bf6e2ebe85f383e531f6af189a68"
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
