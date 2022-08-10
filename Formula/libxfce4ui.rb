class Libxfce4ui < Formula
  desc "Commonly used Xfce widgets among Xfce applications"
  homepage "https://xfce.org/"
  url "https://archive.xfce.org/src/xfce/libxfce4ui/4.16/libxfce4ui-4.16.1.tar.bz2"
  sha256 "d96946ae5af6bf078dda415419e0021909f763ee0020b42f3e26f603e51585f6"
  license "LGPL-2.0-or-later"

  bottle do
    root_url "https://github.com/brewOS/homebrew-xfce/releases/download/libxfce4ui-4.16.1"
    sha256 x86_64_linux: "3568c785f5935a1f3ae816a40713e3ddb484804db9fa70fcbc2e478725bf0630"
  end

  depends_on "brewos/xfce/xfce4-dev-tools" => :build
  depends_on "gettext" => :build
  depends_on "intltool" => :build
  depends_on "pkg-config" => :build
  depends_on "brewos/xfce/libxfce4util"
  depends_on "brewos/xfce/xfconf"
  depends_on "glade"
  depends_on "glib"
  depends_on "gtk+3"
  depends_on "libgtop"
  depends_on "libsm"
  depends_on "startup-notification"

  uses_from_macos "perl" => :build
  uses_from_macos "libxml2"

  def install
    ENV.prepend_create_path "PERL5LIB", Formula["intltool"].libexec/"lib/perl5" unless OS.mac?

    system "./configure", *std_configure_args, "--disable-silent-rules"
    system "make", "install"
  end

  test do
    assert_predicate prefix, :exist? # stub
  end
end
