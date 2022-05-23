//
//  User.swift
//  Home Work 2.3
//
//  Created by Дмитрий Бородулькин on 23.05.2022.
//

import Security

struct User {
    let login: String
    let password: String
    let person: Person
    
    static func getUserData() -> User {
        User(login: "User",
             password: "Password",
             person: Person.getPerson()
        )
    }
}

struct Person {
    let name: String
    let surname: String
    let image: String
    
    var fullName: String {
        "\(name) \(surname)"
    }
    
    static func getPerson() -> Person {
        Person(name: "Dmitry", surname: "Borodulkin", image: "SwiftImage")
    }
}
