class Graphiq < Formula
  desc "Structural code intelligence — BM25 + graph walk search, blast radius, structural context"
  homepage "https://github.com/aaf2tbz/graphiq"
  version "3.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/aaf2tbz/graphiq/releases/download/v#{version}/graphiq-aarch64-apple-darwin.tar.gz"
      sha256 "e8d19a7d0df4089464745783585ef76c1909cead8c9bf6d48908a140194c539b"
    end
    on_intel do
      url "https://github.com/aaf2tbz/graphiq/releases/download/v#{version}/graphiq-x86_64-apple-darwin.tar.gz"
      sha256 "8bcd2fb0a8943fb1e259b39bee98bc70acf082972e72e9813697998410fd27f3"
    end
  end

  on_linux do
    url "https://github.com/aaf2tbz/graphiq/releases/download/v#{version}/graphiq-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "5b8706b5bd146aea89eda96f5862e5edd6a145e0df4657d83c189171864f7d26"
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
