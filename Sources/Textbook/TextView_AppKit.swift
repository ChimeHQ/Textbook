import SwiftUI

#if os(macOS) && !targetEnvironment(macCatalyst)
import AppKit

@MainActor
public struct TextView: NSViewRepresentable {
	private var makeTextView: () -> NSTextView

	@Binding public var text: String

	public init(
		text: Binding<String>,
		makeTextView: @escaping () -> NSTextView = { NSTextView() }
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
