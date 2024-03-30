import XCTest
import Textbook

final class TextbookTests: XCTestCase {
	@MainActor
    func testCreateView() throws {
		let view = TextView(text: .constant("hello"))

		XCTAssertEqual(view.text, "hello")
    }
}
