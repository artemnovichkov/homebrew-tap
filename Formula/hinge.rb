class Hinge < Formula
  desc "Control the hinge angle of a foldable iPhone Simulator"
  homepage "https://github.com/artemnovichkov/hinge"
  url "https://github.com/artemnovichkov/hinge/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "5123ffc0d0e1dca2ab618f53bba6b0ff49e4da731b3e7590a9d7e14c60ff6649"
  license "MIT"

  depends_on :macos

  def install
    libexec.install Dir["skills/hinge/scripts/*"]
    bin.install_symlink libexec/"hinge"
  end

  def caveats
    <<~EOS
      hinge requires Xcode with a foldable iOS Simulator runtime (e.g. iPhone Duo).
      The first run compiles a small helper and caches it in ~/.cache/hinge.
    EOS
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/hinge --version").strip
  end
end
