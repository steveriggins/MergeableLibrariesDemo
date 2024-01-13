//
//  ContentView.swift
//  Mergable Libraries
//
//  Created by Steven W. Riggins on 1/11/24.
//

import SwiftUI
import SwiftData
import SameProjectA
import SameProjectB
import ExternalC

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]

    var body: some View {
		VStack {
			Text(SameProjectA().text)
			Text(SameProjectB().text)
			Text(ExternalC.shared.text)
				.foregroundColor(ExternalC.shared.color)
			ExternalC.shared.mansion
				.resizable()
			ExternalC.shared.image
		}
	}

    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
