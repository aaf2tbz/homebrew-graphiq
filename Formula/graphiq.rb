class Graphiq < Formula
  desc "Code intelligence with structural retrieval — BM25, graph traversal, heuristic reranking"
  homepage "https://github.com/aaf2tbz/graphiq"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/aaf2tbz/graphiq/releases/download/v#{version}/graphiq-aarch64-apple-darwin.tar.gz"
      sha256 "1d20637dcb58725baace906a50b835e67377ce87155c647d835a2207203af5fc"
    end
    on_intel do
      url "https://github.com/aaf2tbz/graphiq/releases/download/v#{version}/graphiq-x86_64-apple-darwin.tar.gz"
      sha256 "8960f6573dbb206799b5cd630e4631d97d25e66df25844b98156d717e9312774"
    end
  end

  on_linux do
    url "https://github.com/aaf2tbz/graphiq/releases/download/v#{version}/graphiq-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "ef7164cdf08abe28ad1fb82d025ab50984255a30a7b1afca61f54be5b2cb1475"
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
