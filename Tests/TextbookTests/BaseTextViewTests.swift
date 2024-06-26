import XCTest
import Textbook

#if os(macOS) && !targetEnvironment(macCatalyst)
final class MockTextViewDelegate: NSObject, NSTextViewDelegate {
	var textViewDoCommandBy: (_ commandSelector: Selector) -> Bool = { _ in true }

	func textView(_ textView: NSTextView, doCommandBy commandSelector: Selector) -> Bool {
		textViewDoCommandBy(commandSelector)
	}
}

final class BaseTextViewTests: XCTestCase {
	@MainActor
	func testStockMissingDoCommandBy() {
		let view = NSTextView()
		let delegate = MockTextViewDelegate()

		view.delegate = delegate

		var invoked = false

		delegate.textViewDoCommandBy = { _ in
			invoked = true

			return true
		}

		view.paste(nil)
		view.pasteAsRichText(nil)
		view.pasteAsPlainText(nil)
		XCTAssertFalse(invoked, "Should this ever fail, behavior has changed!")
	}

	@MainActor
	func testPasteDoCommandBy() {
		let view = BaseTextView()
		let delegate = MockTextViewDelegate()

		view.delegate = delegate

		var invoked = false

		delegate.textViewDoCommandBy = {
			XCTAssertEqual($0, #selector(NSTextView().paste(_:)))

			invoked = true

			return true
		}

		view.paste(nil)
		XCTAssertTrue(invoked)
	}

	@MainActor
	func testPasteAsRichTextDoCommandBy() {
		let view = BaseTextView()
		let delegate = MockTextViewDelegate()

		view.delegate = delegate

		var invoked = false

		delegate.textViewDoCommandBy = {
			XCTAssertEqual($0, #selector(NSTextView().pasteAsRichText(_:)))

			invoked = true

			return true
		}

		view.pasteAsRichText(nil)
		XCTAssertTrue(invoked)
	}

	@MainActor
	func testPasteAsPlainTextDoCommandBy() {
		let view = BaseTextView()
		let delegate = MockTextViewDelegate()

		view.delegate = delegate

		var invoked = false

		delegate.textViewDoCommandBy = {
			XCTAssertEqual($0, #selector(NSTextView().pasteAsPlainText(_:)))

			invoked = true

			return true
		}

		view.pasteAsPlainText(nil)
		XCTAssertTrue(invoked)
	}
}
#endif
