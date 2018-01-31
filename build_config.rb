
CC = `xcrun -find clang`.strip

def sdk_path(device); `xcrun --sdk #{device} --show-sdk-path`.strip end
IOS_FLAGS = %W(-Os -arch armv7 -arch arm64 -isysroot #{sdk_path 'iphoneos'})
IOSSIM_FLAGS = %W(-Os -arch i386 -arch x86_64 -isysroot #{sdk_path 'iphonesimulator'})
TVOS_FLAGS = %W(-Os -arch arm64 -isysroot #{sdk_path 'appletvos'})
TVOSSIM_FLAGS = %W(-Os -arch x86_64 -isysroot #{sdk_path 'appletvsimulator'})


MRuby::Build.new do |conf|
  toolchain :clang
  conf.gembox 'default'
end

MRuby::CrossBuild.new('ios') do |conf|
  conf.gembox 'default'

  conf.cc do |cc|
    cc.command = CC
    cc.flags = IOS_FLAGS
  end

  conf.linker do |linker|
    linker.command = CC
    linker.flags = IOS_FLAGS
  end
end

MRuby::CrossBuild.new('ios-simulator') do |conf|
  conf.gembox 'default'

  conf.cc do |cc|
    cc.command = CC
    cc.flags = IOSSIM_FLAGS
  end

  conf.linker do |linker|
    linker.command = CC
    linker.flags = IOSSIM_FLAGS
  end
end

MRuby::CrossBuild.new('tvos') do |conf|
  conf.gembox 'default'

  conf.cc do |cc|
    cc.command = CC
    cc.flags = TVOS_FLAGS
  end

  conf.linker do |linker|
    linker.command = CC
    linker.flags = TVOS_FLAGS
  end
end

MRuby::CrossBuild.new('tvos-simulator') do |conf|
  conf.gembox 'default'

  conf.cc do |cc|
    cc.command = CC
    cc.flags = TVOSSIM_FLAGS
  end

  conf.linker do |linker|
    linker.command = CC
    linker.flags = TVOSSIM_FLAGS
  end
end
