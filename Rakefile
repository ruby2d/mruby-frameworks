
task :build_mruby do
  Dir.chdir('mruby') do
    ENV['MRUBY_CONFIG'] = "../build_config.rb"
    system 'rake'

    Dir.chdir('build') do
      FileUtils.mkdir_p 'ios-universal'
      `lipo ios/lib/libmruby.a ios-simulator/lib/libmruby.a -create -output ios-universal/libmruby.a`

      FileUtils.mkdir_p 'tvos-universal'
      `lipo tvos/lib/libmruby.a tvos-simulator/lib/libmruby.a -create -output tvos-universal/libmruby.a`
    end
  end

  FileUtils.mkdir_p "ios/MRuby.framework/Headers"
  FileUtils.cp_r "mruby/include/.", "ios/MRuby.framework/Headers"
  FileUtils.cp "Info.plist", "ios/MRuby.framework"
  FileUtils.cp "mruby/build/ios-universal/libmruby.a", "ios/MRuby.framework/MRuby"

  FileUtils.mkdir_p "tvos/MRuby.framework/Headers"
  FileUtils.cp_r "mruby/include/.", "tvos/MRuby.framework/Headers"
  FileUtils.cp "Info.plist", "tvos/MRuby.framework"
  FileUtils.cp "mruby/build/tvos-universal/libmruby.a", "tvos/MRuby.framework/MRuby"
end

task :update do
  `git submodule update --remote`
end

task default: 'build_mruby'
