// swift-tools-version: 6.0

import PackageDescription

let package = Package(
	name: "Textbook",
	platforms: [
		.macOS(.v10_15),
		.macCatalyst(.v13),
		.iOS(.v13),
		.tvOS(.v13),
		.visionOS(.v1),
	],
	products: [
		.library(name: "Textbook", targets: ["Textbook"]),
	],
	targets: [
		.target(name: "Textbook"),
		.testTarget(name: "TextbookTests", dependencies: ["Textbook"]),
	]
)
