class Graphiq < Formula
  desc "Code intelligence with structural retrieval — BM25, graph traversal, heuristic reranking"
  homepage "https://github.com/aaf2tbz/graphiq"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/aaf2tbz/graphiq/releases/download/v#{version}/graphiq-aarch64-apple-darwin.tar.gz"
      sha256 "4891d76fd714b8b686e0fa48cb66db02f12aa6bea3d72e6179ed854b7f2353a5"
    end
    on_intel do
      url "https://github.com/aaf2tbz/graphiq/releases/download/v#{version}/graphiq-x86_64-apple-darwin.tar.gz"
      sha256 "b1536589369ac5bdb3087157caf70732508b43966192757e80237ca958c12d7b"
    end
  end

  on_linux do
    url "https://github.com/aaf2tbz/graphiq/releases/download/v#{version}/graphiq-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "96ffe22dd2d0b4ab98e2ab3464de097e86756c4d2285908c4da5d5d6a877fea5"
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
