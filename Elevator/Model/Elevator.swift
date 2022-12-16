//
//  Elevator.swift
//  Elevator
//
//  Created by Kaique Monteiro on 15/12/22.
//

import Foundation

protocol Elevator {
    var direction: Direction { get set }
    var currentFloor: Int { get set }
    var targetFloors: [Int: [any Person]] { get set }
}

class SimpleElevator: Elevator {
    var direction: Direction

    var currentFloor: Int

    var targetFloors: [Int : [any Person]]

    init(directon: Direction = .stopped,
         currentFloor: Int = 0,
         targetFloors: [Int: [any Person]] = [:]) {
        self.direction = directon
        self.currentFloor = currentFloor
        self.targetFloors = targetFloors
    }

    func updatePosition() {
        switch direction {
        case .up:
            currentFloor += 1
        case .down:
            currentFloor -= 1
        default:
            break
        }

        if let people = targetFloors[currentFloor], !people.isEmpty {
            targetFloors[currentFloor] = []
        }
    }

    func load(people: [any Person]) {
        for person in people {
            targetFloors[person.target]?.append(person)
        }
    }

}
