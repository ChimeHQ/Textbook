<div align="center">

[![Build Status][build status badge]][build status]
[![Platforms][platforms badge]][platforms]
[![Documentation][documentation badge]][documentation]
[![Matrix][matrix badge]][matrix]

</div>

# Textbook
Easier NSTextView/UITextView and SwiftUI 

## Installation

```swift
dependencies: [
    .package(url: "https://github.com/ChimeHQ/Textbook", branch: "main")
],
```

## Usage

### `BaseTextView`

This is an `NSTextView` subclass that aims for an absolute minimal amount of changes. Things are allowed only if they are required for correct functionality. It is intended to be a drop-in replacement for `NSTextView`, and should maintain compatibilty with existing subclasses. Behaviors are appropriate for all types of text.

- Additional routing to `NSTextViewDelegate.textView(_:, doCommandBy:) -> Bool`:  `paste`, `pasteAsRichText`, `pasteAsPlainText`
- Hooks for `onKeyDown`, `onFlagsChanged`, `onMouseDown`
- Configurable selection notifcation delivery via `continuousSelectionNotifications`

## Contributing and Collaboration

I would love to hear from you! Issues or pull requests work great. A [Matrix space][matrix] is also available for live help, but I have a strong bias towards answering in the form of documentation.

I prefer collaboration, and would love to find ways to work together if you have a similar project.

I prefer indentation with tabs for improved accessibility. But, I'd rather you use the system you want and make a PR than hesitate because of whitespace.

By participating in this project you agree to abide by the [Contributor Code of Conduct](CODE_OF_CONDUCT.md).

[build status]: https://github.com/ChimeHQ/Textbook/actions
[build status badge]: https://github.com/ChimeHQ/Textbook/workflows/CI/badge.svg
[platforms]: https://swiftpackageindex.com/ChimeHQ/Textbook
[platforms badge]: https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2FChimeHQ%2FTextbook%2Fbadge%3Ftype%3Dplatforms
[documentation]: https://swiftpackageindex.com/ChimeHQ/Textbook/main/documentation
[documentation badge]: https://img.shields.io/badge/Documentation-DocC-blue
[matrix]: https://matrix.to/#/%23chimehq%3Amatrix.org
[matrix badge]: https://img.shields.io/matrix/chimehq%3Amatrix.org?label=Matrix
