//
//  Person.swift
//  Elevator
//
//  Created by Kaique Monteiro on 15/12/22.
//

import Foundation

class Person : Hashable {
    var id: String
    var origin: Int
    var target: Int
    var arrivingTick: Int
    var elevatorEntryTick: Int
    var exitTick: Int

    init(id: String, origin: Int, target: Int, arrivingTick: Int, elevatorEntryTick: Int, exitTick: Int) {
        self.id = id
        self.origin = origin
        self.target = target
        self.arrivingTick = arrivingTick
        self.elevatorEntryTick = elevatorEntryTick
        self.exitTick = exitTick
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.id == rhs.id
    }
}
