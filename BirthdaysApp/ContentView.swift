//
//  ContentView.swift
//  BirthdaysApp
//
//  Created by India Poetzscher on 4/26/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Query private var friends: [Friend] = [
        Friend(name: "Leki", birthday: .now),
        Friend(name: "Lexi", birthday: Date(timeIntervalSince1970: 0))
    ]
    @Environment(\.modelContext) private var context
    @State private var newName = ""
    @State private var newBirthday = Date.now
    
    var body: some View {
        NavigationStack {
            List(friends) { friend in
                HStack {
                    Text(friend.name)
                    Spacer()
                    Text(friend.birthday, format: .dateTime.month(.wide).day().year())
                }
            }
            .navigationTitle("Birthdays")
            .safeAreaInset(edge: .bottom) {
                VStack(alignment: .center, spacing: 20) {
                    Text("New Birthday")
                        .font(.headline)
                    DatePicker(selection: $newBirthday, in: Date.distantPast...Date.now, displayedComponents: .date) {
                        TextField("Name", text: $newName)
                            .textFieldStyle(.roundedBorder)
                    }
                    Button("Save") {
                        let newFriend = Friend(name: newName, birthday: newBirthday)
                        context.insert(newFriend)
                        newName = ""
                        newBirthday = Date.now
                    }
                    .bold()
                }
                .padding()
                .background(.bar)
            }
        }
    }
    
}

#Preview {
    ContentView()
        .modelContainer(for: Friend.self, inMemory: true)
}
