class RushParallel < Formula
  desc "Cross-platform command-line tool for executing jobs in parallel"
  homepage "https://github.com/shenwei356/rush"
  url "https://github.com/shenwei356/rush/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "8046a0ac9ed10d2adff250ab5b95a95c895cae3b43d2a25bd95979f319146cb9"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(output: bin/"rush")
  end

  test do
    assert_equal "01\n02\n03\n04\n",
    shell_output("seq 1 4 | #{bin}/rush -k 'echo 0{}'")
  end
end
