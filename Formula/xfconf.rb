class Xfconf < Formula
  desc "Xfce hierarchical (tree-like) configuration system"
  homepage "https://xfce.org/"
  url "https://archive.xfce.org/src/xfce/xfconf/4.16/xfconf-4.16.0.tar.bz2"
  sha256 "652a119007c67d9ba6c0bc7a740c923d33f32d03dc76dfc7ba682584e72a5425"
  license all_of: ["GPL-2.0-only", "LGPL-2.0-only"]

  bottle do
    root_url "https://github.com/brewOS/homebrew-xfce/releases/download/xfconf-4.16.0"
    sha256 x86_64_linux: "d933ea909d0dff95c9e41fb3580b1007987b34a15c5c569d836beda75ed5ace2"
  end

  depends_on "gettext" => :build
  depends_on "glib-utils" => :build
  depends_on "intltool" => :build
  depends_on "pkg-config" => :build
  depends_on "brewos/xfce/libxfce4util"
  depends_on "glib"

  uses_from_macos "perl" => :build

  def install
    ENV.prepend_create_path "PERL5LIB", Formula["intltool"].libexec/"lib/perl5" unless OS.mac?

    system "./configure", *std_configure_args, "--disable-silent-rules"
    system "make", "install"
  end

  test do
    assert_predicate prefix, :exist? # stub
  end
end
