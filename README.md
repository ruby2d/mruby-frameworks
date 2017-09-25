# MRuby iOS and tvOS frameworks

Run `rake` to cross compile and build the frameworks. Run `rake update` to update the MRuby source directory submodule.

The prebuilt frameworks are located in `ios/` and `tvos/`, respectively.

⚠️ When using these frameworks in an Xcode project, make sure to add `"$(SRCROOT)/MRuby.framework/Headers"` to the "Header Search Paths" in the build settings.
