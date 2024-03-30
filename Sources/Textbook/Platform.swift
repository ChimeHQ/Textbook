import SwiftUI

#if os(macOS) && !targetEnvironment(macCatalyst)
import AppKit

typealias NSUITextView = NSTextView

#elseif os(iOS) || os(tvOS) || os(visionOS)
import UIKit

typealias NSUITextView = UITextView
#endif
