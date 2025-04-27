//
//  Friend.swift
//  BirthdaysApp
//
//  Created by India Poetzscher on 4/27/25.
//

import Foundation
import SwiftData

@Model
class Friend {
    var name: String
    var birthday: Date
    
    init(name: String, birthday: Date) {
        self.name = name
        self.birthday = birthday
    }
}
