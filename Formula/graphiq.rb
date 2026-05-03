class Graphiq < Formula
  desc "Code intelligence with structural retrieval"
  homepage "https://github.com/aaf2tbz/graphiq"
  version "3.4.0"

  if Hardware::CPU.arm?
    if OS.mac?
      url "https://github.com/aaf2tbz/graphiq/releases/download/v3.4.0/graphiq-aarch64-apple-darwin.tar.gz"
      sha256 "03f080960f97f58ba4a1d86e2b7b8e149440ccd0f1540caa8158e6c08a6ce32e"
    end
  elsif Hardware::CPU.intel?
    if OS.mac?
      url "https://github.com/aaf2tbz/graphiq/releases/download/v3.4.0/graphiq-x86_64-apple-darwin.tar.gz"
      sha256 "829fcb2d000100afaa5207b646a288b04c37d81e5ba3834ead6fa27ef29e9a90"
    elsif OS.linux?
      url "https://github.com/aaf2tbz/graphiq/releases/download/v3.4.0/graphiq-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "009387c0889d500d6f8a9dc12edae0edbbd6f31544d24a925c2e862fbb92b18b"
    end
  end

  def install
    bin.install "graphiq"
    bin.install "graphiq-mcp" if File.exist?("graphiq-mcp")
    bin.install "graphiq-bench" if File.exist?("graphiq-bench")
  end

  test do
    system "#{bin}/graphiq", "--version"
  end
end