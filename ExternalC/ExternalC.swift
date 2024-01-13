//
//  ExternalC.swift
//  ExternalC
//
//  Created by Steven W. Riggins on 1/11/24.
//

import Foundation
import SwiftUI

class Foo {
	
}

public struct ExternalC {
	static public let shared = ExternalC()
	
	public var text = "I am external!!"
	public var color: Color
	public var image: Image
	public var mansion: Image
	
	public init() {
		color = Color(.playbookPrimary)
		image = Image(.placeholder)

		let bundle = Bundle(for: Foo.self)
		if let fileURL = bundle.url(forResource: "mansion", withExtension: "jpeg"),
		   let data = try? Data(contentsOf: fileURL),
		   let uiImage = UIImage(data: data) {
			mansion = Image(uiImage: uiImage)
		} else {
			mansion = Image("shouldnotbeaccessed.jpeg")
		}
	}
}
