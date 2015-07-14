require 'formula'

class Frotz < Formula
  url 'https://github.com/DavidGriffith/frotz/archive/2.44.tar.gz'
  homepage 'https://github.com/DavidGriffith/frotz'
  sha1 '0dcccb54ef64c91d217f21cdef10ebb00ec00522'
  head 'git@github.com:DavidGriffith/frotz.git'

  def install
    inreplace "Makefile" do |s|
      s.remove_make_var! %w[CC OPTS]
      s.change_make_var! "PREFIX", prefix
      s.change_make_var! "CONFIG_DIR", etc
      s.change_make_var! "MAN_PREFIX", share
    end

    system "make frotz"
    system "make install"
  end
end

