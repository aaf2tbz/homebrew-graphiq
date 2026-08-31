class Graphiq < Formula
  desc "Code intelligence with structural retrieval"
  homepage "https://github.com/aaf2tbz/graphiq"
  version "4.4.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aaf2tbz/graphiq/releases/download/v4.4.0/graphiq-aarch64-apple-darwin.tar.gz"
      sha256 "379a6414e320d6afd77652afc4b0b4358155163ddb4f5c5f7a7f7219fea723e3"
    elsif Hardware::CPU.intel?
      url "https://github.com/aaf2tbz/graphiq/releases/download/v4.4.0/graphiq-x86_64-apple-darwin.tar.gz"
      sha256 "821d34df2b61e025629bc3b3e18384cc99b42b67841d9759786b585e7e272a47"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/aaf2tbz/graphiq/releases/download/v4.4.0/graphiq-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7b4b6af2380194d525af9bace7d8114bf7d94f9441a78cef286feda6b7b2045e"
    elsif Hardware::CPU.intel?
      url "https://github.com/aaf2tbz/graphiq/releases/download/v4.4.0/graphiq-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a78f832e47ca40a7e3f24ebe47c96293c7bbf7b8fe665cc2ecaeaf1fd48e202e"
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
