class Graphiq < Formula
  desc "Structural code intelligence — BM25 + graph walk search, blast radius, structural context"
  homepage "https://github.com/aaf2tbz/graphiq"
  version "3.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/aaf2tbz/graphiq/releases/download/v#{version}/graphiq-aarch64-apple-darwin.tar.gz"
      sha256 "de566df358811a71317e4d415d1423d17fe352d00c41b6baeef4087bd4bff7a9"
    end
    on_intel do
      url "https://github.com/aaf2tbz/graphiq/releases/download/v#{version}/graphiq-x86_64-apple-darwin.tar.gz"
      sha256 "d427c3bb2f9fe72619e731fa464695778d7c7744bec134aeec15d2e13c2cdcc3"
    end
  end

  on_linux do
    url "https://github.com/aaf2tbz/graphiq/releases/download/v#{version}/graphiq-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "95826f731611ddb0f58e92e31451f3e20aa4a45650db53d0ac082aab033e14ef"
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
