mruby_version = '1.4.0'

desc 'Clean the project build files'
task :clean do
  FileUtils.remove_dir 'ios/MRuby.framework', true
  FileUtils.remove_dir 'tvos/MRuby.framework', true
  FileUtils.remove_dir 'mruby/build', true
end

desc 'Build MRuby for iOS and tvOS'
task :build_mruby => :clean do
  Dir.chdir('mruby') do
    ENV['MRUBY_CONFIG'] = '../build_config.rb'
    system 'rake'

    Dir.chdir('build') do
      FileUtils.mkdir_p 'ios-universal'
      `lipo ios/lib/libmruby.a ios-simulator/lib/libmruby.a -create -output ios-universal/libmruby.a`

      FileUtils.mkdir_p 'tvos-universal'
      `lipo tvos/lib/libmruby.a tvos-simulator/lib/libmruby.a -create -output tvos-universal/libmruby.a`
    end
  end

  FileUtils.mkdir_p 'ios/MRuby.framework/Headers'
  FileUtils.cp_r 'mruby/include/.', 'ios/MRuby.framework/Headers'
  FileUtils.cp 'Info.plist', 'ios/MRuby.framework'
  FileUtils.cp 'mruby/build/ios-universal/libmruby.a', 'ios/MRuby.framework/MRuby'

  FileUtils.mkdir_p 'tvos/MRuby.framework/Headers'
  FileUtils.cp_r 'mruby/include/.', 'tvos/MRuby.framework/Headers'
  FileUtils.cp 'Info.plist', 'tvos/MRuby.framework'
  FileUtils.cp 'mruby/build/tvos-universal/libmruby.a', 'tvos/MRuby.framework/MRuby'
end

desc 'Set MRuby submodule to latest release'
task :mruby_latest do
  system 'git submodule update --remote && '\
         'cd mruby && '\
         "git checkout tags/#{mruby_version}"
end

desc 'Set MRuby submodule to master branch'
task :mruby_master do
  system 'git submodule update --remote && '\
         'cd mruby && '\
         'git checkout master && '\
         'git pull --rebase'
end

task default: 'build_mruby'
