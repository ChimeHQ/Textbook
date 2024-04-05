#if os(macOS) && !targetEnvironment(macCatalyst)
import AppKit

// I guess this should be defined by AppKit, but isn't
fileprivate let NSOldSelectedCharacterRanges = "NSOldSelectedCharacterRanges"

open class BaseTextView: NSTextView {
	public typealias OnEvent = (_ event: NSEvent, _ action: () -> Void) -> Void

	private var lastSelectionValue = [NSValue]()

	public var onKeyDown: OnEvent = { $1() }
	public var onFlagsChanged: OnEvent = { $1() }
	public var onMouseDown: OnEvent = { $1() }
	/// Deliver `NSTextView.didChangeSelectionNotification` for all selection changes.
	///
	/// See the documenation for `setSelectedRanges(_:affinity:stillSelecting:)` for details.
	public var continuousSelectionNotifications: Bool = false
}

extension BaseTextView {
	open override func paste(_ sender: Any?) {
		let handled = delegate?.textView?(self, doCommandBy: #selector(paste(_:))) ?? false

		if handled == false {
			super.paste(sender)
		}
	}

	open override func pasteAsRichText(_ sender: Any?) {
		let handled = delegate?.textView?(self, doCommandBy: #selector(pasteAsRichText(_:))) ?? false

		if handled == false {
			super.pasteAsRichText(sender)
		}
	}

	open override func pasteAsPlainText(_ sender: Any?) {
		let handled = delegate?.textView?(self, doCommandBy: #selector(pasteAsPlainText(_:))) ?? false

		if handled == false {
			super.pasteAsPlainText(sender)
		}
	}
}

extension BaseTextView {
	open override func keyDown(with event: NSEvent) {
		onKeyDown(event) {
			super.keyDown(with: event)
		}
	}

	open override func flagsChanged(with event: NSEvent) {
		onFlagsChanged(event) {
			super.flagsChanged(with: event)
		}
	}

	open override func mouseDown(with event: NSEvent) {
		onMouseDown(event) {
			super.mouseDown(with: event)
		}
	}
}

extension BaseTextView {
	open override func setSelectedRanges(_ ranges: [NSValue], affinity: NSSelectionAffinity, stillSelecting stillSelectingFlag: Bool) {
		let oldRanges = selectedRanges

		super.setSelectedRanges(ranges, affinity: affinity, stillSelecting: stillSelectingFlag)

		// try to filter out notifications that have already been set
		if ranges == lastSelectionValue {
			return
		}

		lastSelectionValue = ranges

		if stillSelectingFlag && continuousSelectionNotifications {
			let userInfo: [AnyHashable: Any] = [NSOldSelectedCharacterRanges: oldRanges]

			NotificationCenter.default.post(name: NSTextView.didChangeSelectionNotification, object: self, userInfo: userInfo)
		}
	}
}
#endif

