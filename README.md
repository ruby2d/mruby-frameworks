# MRuby iOS and tvOS frameworks

Run `rake` to cross compile and build the frameworks.

Run `git submodule update --remote` to update the MRuby source directory submodule.

Note: When using these frameworks in an Xcode project, make sure to add `"$(SRCROOT)/MRuby.framework/Headers"` to the "Header Search Paths" in the build settings.
