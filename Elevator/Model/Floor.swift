//
//  Floor.swift
//  Elevator
//
//  Created by Kaique Monteiro on 15/12/22.
//

import Foundation

class Floor {
    var number: Int
    var people: [Person]
    var elevatorCalled: Bool
    var desiredDirection: Direction?

    init(number: Int, people: [Person], elevatorCalled: Bool, desiredDirection: Direction?) {
        self.number = number
        self.people = people
        self.elevatorCalled = elevatorCalled
        self.desiredDirection = desiredDirection
    }
}
