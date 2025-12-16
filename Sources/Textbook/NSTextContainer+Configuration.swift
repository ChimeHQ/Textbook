#if os(macOS) && !targetEnvironment(macCatalyst)
import AppKit
#elseif os(iOS)
import UIKit
#endif

@available(macOS 12.0, macCatalyst 15.0, iOS 15.0, tvOS 15.0, *)
extension NSTextContainer {
	public static var defaultTextKit2Container: NSTextContainer {
		let textContainer = NSTextContainer(size: CGSize(width: 1000.0, height: 1.0e7))
		let textContentManager = NSTextContentStorage()
		let textLayoutManager = NSTextLayoutManager()

		textLayoutManager.textContainer = textContainer
		textContentManager.addTextLayoutManager(textLayoutManager)

		return textContainer
	}
}
