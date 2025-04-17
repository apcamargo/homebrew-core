class Brename < Formula
  desc "Cross-platform command-line tool for safe batch renaming via regular expressions"
  homepage "https://github.com/shenwei356/brename"
  url "https://github.com/shenwei356/brename/archive/refs/tags/v2.14.0.tar.gz"
  sha256 "a16bceb25a75afa14c5dae2248c1244f1083b80b62783ce5dbf3e46ff68867d5"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(tags: "netgo")
  end

  test do
    touch "Homebrew-1.txt"
    system bin/"brename", "-p", "'.*-(\d+).*'", "-r", "'$1.txt'", "Homebrew-1.txt"
    refute_path_exists testpath/"Homebrew-1.txt"
    assert_path_exists testpath/"1.txt"
  end
end
