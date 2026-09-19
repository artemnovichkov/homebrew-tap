class Hinge < Formula
  desc "Control the hinge angle of a foldable iPhone Simulator"
  homepage "https://github.com/artemnovichkov/hinge"
  url "https://github.com/artemnovichkov/hinge/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "57ca704a6824f94fe7734004b40fa24ef945ba0be05e5d632bb3eacaff0e3725"
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
