class Graphiq < Formula
  desc "Code intelligence with structural retrieval"
  homepage "https://github.com/aaf2tbz/graphiq"
  version "4.1.5"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aaf2tbz/graphiq/releases/download/v4.1.5/graphiq-aarch64-apple-darwin.tar.gz"
      sha256 "157707ae3445a42d939b7c9c9698b788f6299b90f1d30a79f9a5dd2cadcf20ea"
    elsif Hardware::CPU.intel?
      url "https://github.com/aaf2tbz/graphiq/releases/download/v4.1.5/graphiq-x86_64-apple-darwin.tar.gz"
      sha256 "46339b4e75e615c0b98ea4259acdb68744a30b0fa130cbdf1430ef5cf3190c78"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/aaf2tbz/graphiq/releases/download/v4.1.5/graphiq-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "99f2caa364dee22990f7709b9133e0e3ac092bc877129048c4397ea0b56fb2e9"
    elsif Hardware::CPU.intel?
      url "https://github.com/aaf2tbz/graphiq/releases/download/v4.1.5/graphiq-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b8cd89c4908c84916d64f71cf242249c78265f5887fbb5d199b47f0d3737b68a"
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
