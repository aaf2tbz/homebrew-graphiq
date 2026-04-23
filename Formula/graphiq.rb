class Graphiq < Formula
  desc "Structural code intelligence — BM25 + graph walk search, blast radius, structural context"
  homepage "https://github.com/aaf2tbz/graphiq"
  version "3.1.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/aaf2tbz/graphiq/releases/download/v#{version}/graphiq-aarch64-apple-darwin.tar.gz"
      sha256 "347f704a7a94d147d4a57b2be7cffed8b328ccdfa336b2735518162c4909744a"
    end
    on_intel do
      url "https://github.com/aaf2tbz/graphiq/releases/download/v#{version}/graphiq-x86_64-apple-darwin.tar.gz"
      sha256 "492fca95464767e861eb4ffbdf208d0de35b08746c68ee4d7bd51269fd5855ba"
    end
  end

  on_linux do
    url "https://github.com/aaf2tbz/graphiq/releases/download/v#{version}/graphiq-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "27a20f2d6167ed31b3ffdcbdeb79be3a95504761594366a0b48e14368fbdffd3"
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
