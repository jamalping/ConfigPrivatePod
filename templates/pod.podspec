Pod::Spec.new do |s|

  s.name         = "__ProjectName__"
  s.version      = "0.1.0"
  s.summary      = "__ProjectName__."

  s.description  = <<-DESC
                    this is __ProjectName__
                   DESC

  s.homepage     = "__HomePage__"

  s.license      = { :type => "MIT", :file => "FILE_LICENSE" }

  s.author       = "__Author__"

  s.platform     = :ios, '9.0'

  #  When using multiple platforms
  # s.ios.deployment_target = '5.0'
  # s.osx.deployment_target = '10.7'
  # s.watchos.deployment_target = '2.0'
  # s.tvos.deployment_target = '9.0'

  s.source       = { :git => "__HTTPSRepo__", :tag => s.version.to_s }

  s.source_files = "__ProjectName__/Classes/**/*"
  s.swift_version = '5.0'

  #- 推荐这种 -#
  # s.resource_bundles = {
  #   "__ProjectName__" => ["__ProjectName__/Assets/**/*"]
  # }

  # s.resources  = "__ProjectName__/**/*.{storyboard,xib}", "__ProjectName__/Assets/*"
  # s.resources = "Resources/*.png"

  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"

  # s.framework  = "SomeFramework"
  # s.frameworks = "SomeFramework", "AnotherFramework"

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "AFNetworking"

end
