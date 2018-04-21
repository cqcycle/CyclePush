

Pod::Spec.new do |s|


s.name         = "CycleJPush"
s.version      = "1.0.1"
s.summary      = "CycleJPush extension JPush"
s.homepage     = "https://github.com/cqcycle/CyclePush.git"
s.license      = "MIT"
s.author       = { "zhoubo" => "15696564260@163.com" }
s.platform     = :ios, "8.0"
s.source       = { :git => "https://github.com/cqcycle/CyclePush.git", :tag => s.version.to_s }

s.source_files  = "CycleJPush","CycleJPush/**/*.{h,m}"
#s.public_header_files = "CycleJPush/**/*.h"
s.frameworks = "UIKit", "Foundation"
s.requires_arc = true


# s.resource  = "icon.png"
# s.resources = "Resources/*.png"

# s.preserve_paths = "FilesToSave", "MoreFilesToSave"


s.frameworks  = "UIKit","Foundation"
# s.frameworks = "SomeFramework", "AnotherFramework"

# s.libraries = "libz", "libresolv"

# s.dependency "JSONKit", "~> 1.4"


end
