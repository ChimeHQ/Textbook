import SwiftUI

#if os(iOS) || os(tvOS) || os(visionOS)
import UIKit

@MainActor
public struct TextView: UIViewRepresentable {
	private var makeTextView: () -> UITextView

	@Binding public var text: String

	public init(
		text: Binding<String>,
		makeTextView: @escaping () -> UITextView = { UITextView() }
	) {
		self._text = text
		self.makeTextView = makeTextView
	}

	public func makeUIView(context: Context) -> UITextView {
		makeTextView()
	}

	public func updateUIView(_ uiView: UITextView, context: Context) {
		uiView.text = text
	}
}
#endif
