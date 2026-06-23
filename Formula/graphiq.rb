class Graphiq < Formula
  desc "Code intelligence with structural retrieval"
  homepage "https://github.com/aaf2tbz/graphiq"
  version "4.3.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aaf2tbz/graphiq/releases/download/v4.3.3/graphiq-aarch64-apple-darwin.tar.gz"
      sha256 "277d8c039a28f7dae2d4b1a89fba4a1af2e6e820bc39de3528f8030e1047e8d7"
    elsif Hardware::CPU.intel?
      url "https://github.com/aaf2tbz/graphiq/releases/download/v4.3.3/graphiq-x86_64-apple-darwin.tar.gz"
      sha256 "8709a19d6cbd0419f4db9dbc101675cdff4360007df5fa4fcd53ec255c4d095e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/aaf2tbz/graphiq/releases/download/v4.3.3/graphiq-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0cd09ab6594bbe566f7a67031cf52d9218d82327dc31df32442f771d7490812c"
    elsif Hardware::CPU.intel?
      url "https://github.com/aaf2tbz/graphiq/releases/download/v4.3.3/graphiq-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "341b0e697f9e909f0901af72811c454e51a8ef8a8792c88ceb1213783dc9ac1d"
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
