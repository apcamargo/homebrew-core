class RushParallel < Formula
  desc "A cross-platform command-line tool for executing jobs in parallel"
  homepage "https://github.com/shenwei356/rush"
  url "https://github.com/shenwei356/rush/archive/refs/tags/v0.4.2.tar.gz"
  sha256 "801b17e279406c1649b401a2214148d344f673d0a1c9eed1b417655c1fefd114"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./rush"
  end

  test do
    assert_equal "01\n02\n03\n04\n",
    shell_output("seq 1 4 | #{bin}/rush 'echo 0{}'")
  end
end
