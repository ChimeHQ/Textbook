import SwiftUI

#if os(macOS) && !targetEnvironment(macCatalyst)
import AppKit

@MainActor
public struct TextView: NSViewRepresentable {
	public typealias TextViewProvider = () -> NSTextView
	private var makeTextView: TextViewProvider

	@Binding public var text: String

	public init(
		text: Binding<String>,
		makeTextView: @escaping TextViewProvider = { NSTextView() }
	) {
		self._text = text
		self.makeTextView = makeTextView
	}

	public func makeNSView(context: Context) -> NSScrollView {
		let scrollView = NSScrollView()

		scrollView.documentView = makeTextView()

		return scrollView
	}

	public func updateNSView(_ nsView: NSScrollView, context: Context) {
		let textView = nsView.documentView as! NSTextView

		textView.string = text
	}
}
#endif
