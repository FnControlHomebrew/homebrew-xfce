class Libxfce4util < Formula
  desc "Utility library for the Xfce4 desktop environment"
  homepage "https://xfce.org/"
  url "https://archive.xfce.org/src/xfce/libxfce4util/4.16/libxfce4util-4.16.0.tar.bz2"
  sha256 "60598d745d1fc81ff5ad3cecc3a8d1b85990dd22023e7743f55abd87d8b55b83"
  license "LGPL-2.0-or-later"

  bottle do
    root_url "https://github.com/brewOS/homebrew-xfce/releases/download/libxfce4util-4.16.0"
    sha256 x86_64_linux: "ef0dc8f078ae52839046a726a1c544d6a09b2b893f9f7049e2e7a011c631f2c4"
  end

  depends_on "intltool" => :build
  depends_on "pkg-config" => :build
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
