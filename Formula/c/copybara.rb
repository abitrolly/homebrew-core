class Copybara < Formula
  desc "Tool for transforming and moving code between repositories"
  homepage "https://github.com/google/copybara"
  url "https://github.com/google/copybara"
  sha256 "d7ed070da238473ba8e5c1ef285094bc71d6c4b1f192c401277d3c9613bd1180"
  license "Apache-2.0"
  version "HEAD"
  head "https://github.com/google/copybara.git", branch: "master"

  depends_on "bazelisk" => :build
  depends_on "java"

  def install
    # https://rubydoc.brew.sh/Formula.html#std_configure_args-instance_method
    system "bazel", "build", "//java/com/google/copybara"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test copybara`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "bazel", "tests"
  end
end
