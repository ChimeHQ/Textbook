#if canImport(AppKit) && !targetEnvironment(macCatalyst)
import AppKit

public typealias PlatformTextView = NSTextView
#elseif canImport(UIKit)
import UIKit

public typealias PlatformTextView = UITextView
#endif
