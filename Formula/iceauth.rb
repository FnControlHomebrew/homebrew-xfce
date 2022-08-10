class Iceauth < Formula
  desc "ICE protocol utility"
  homepage "https://gitlab.freedesktop.org/xorg/app/iceauth"
  url "https://xorg.freedesktop.org/archive/individual/app/iceauth-1.0.9.tar.xz"
  sha256 "2cb9dfcb545683af77fb1029bea3fc52dcc8a0666f7b8b2d7373b6ed4c408c05"
  license "MIT"

  bottle do
    root_url "https://github.com/brewOS/homebrew-xfce/releases/download/iceauth-1.0.9"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "26d4f5e54d594a52c915088f1a013e6358de385435e8856314a28c7fc1a6808d"
  end

  depends_on "pkg-config" => :build
  depends_on "libice"
  depends_on "xorgproto"

  def install
    system "./configure", *std_configure_args, "--disable-silent-rules"
    system "make", "install"
  end

  test do
    assert_predicate prefix, :exist? # stub
  end
end
