# MRuby iOS and tvOS frameworks

Run `rake` to cross compile and build the frameworks. To update the MRuby submodule, use `rake mruby_latest` to set to the latest release and `rake mruby_master` to set the master branch.

The prebuilt frameworks are located in `ios/` and `tvos/`, respectively.

⚠️ When using these frameworks in an Xcode project, make sure to add `"$(SRCROOT)/MRuby.framework/Headers"` to the "Header Search Paths" in the build settings.
