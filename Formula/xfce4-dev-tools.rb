class Xfce4DevTools < Formula
  desc "Xfce developer tools"
  homepage "https://xfce.org/"
  url "https://archive.xfce.org/src/xfce/xfce4-dev-tools/4.16/xfce4-dev-tools-4.16.0.tar.bz2"
  sha256 "f50b3070e66f3ebdf331744dd1ec5e1af5de333965d491e15ce05545e8eb4f04"
  license "GPL-2.0-or-later"

  bottle do
    root_url "https://github.com/brewOS/homebrew-xfce/releases/download/xfce4-dev-tools-4.16.0"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "5f32afebb8d6ce0d3a721bc7d5daccd5a2dbc88cd09a5bb29c663e723c843c6a"
  end

  depends_on "automake" => :build
  depends_on "gtk-doc" => :build
  depends_on "intltool" => :build
  depends_on "libtool" => :build
  depends_on "pkg-config" => :build
  depends_on "glib"

  def install
    system "./configure", *std_configure_args, "--disable-silent-rules"
    system "make", "install"
  end

  test do
    assert_predicate prefix, :exist? # stub
  end
end
