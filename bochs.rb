class Bochs < Formula
  homepage "http://bochs.sourceforge.net/"
  url "https://downloads.sourceforge.net/project/bochs/bochs/2.6.7/bochs-2.6.7.tar.gz"
  sha256 "a4354eeb699662da869b038e225160ec726b883f1b4f425a06cf56cbffbb8282"

  bottle do
    root_url "https://homebrew.bintray.com/bottles-x11"
    sha256 "fb8b148b05b1a8530fe3acacd1d48f73b8e6e3c0280dcd42c53e59be86528b4c" => :yosemite
    sha256 "b34000337f75595e77ae5c3bf194ad4b49a24bc363187921218e2ac359ad58f9" => :mavericks
    sha256 "d8eec0430e123c2d8e54b6212ba005bb384fa72c7a827f6be15a106426f22382" => :mountain_lion
  end

  depends_on "pkg-config" => :build
  depends_on :x11
  depends_on "gtk+"

  def install
    system "./configure", "--prefix=#{prefix}",
                          "--with-x11",
                          "--enable-debugger",
                          "--enable-disasm",
                          "--disable-docbook",
                          "--enable-x86-64",
                          "--enable-pci",
                          "--enable-all-optimizations",
                          "--enable-plugins",
                          "--enable-cdrom",
                          "--enable-a20-pin",
                          "--enable-fpu",
                          "--enable-alignment-check",
                          "--enable-large-ramfile",
                          "--enable-debugger-gui",
                          "--enable-readline",
                          "--enable-iodebug",
                          "--enable-xpm",
                          "--enable-show-ips",
                          "--enable-logging",
                          "--enable-usb",
                          "--enable-ne2000",
                          "--enable-cpu-level=6",
                          "--enable-sb16",
                          "--enable-clgd54xx",
                          "--with-term",
                          "--enable-ne2000"

    system "make"
    system "make", "install"
  end

  test do
    system bin/"bochs", "--help"
  end
end
