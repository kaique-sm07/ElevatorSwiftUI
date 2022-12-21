//
//  Elevator.swift
//  Elevator
//
//  Created by Kaique Monteiro on 15/12/22.
//

import Foundation

protocol Elevator {
    var direction: Direction? { get set }
    var currentFloor: Int { get set }
    var targetFloors: [Int: [Person]] { get set }
    func updatePosition(calledFloor: [Int])
    func load(people: [Person])
    func totalPassengers() -> Int
}

class SimpleElevator: Elevator {
    var direction: Direction?

    var currentFloor: Int

    var targetFloors: [Int : [Person]]

    var calledFloor: [Int] = []

    init(direction: Direction?,
         currentFloor: Int = 0,
         targetFloors: [Int: [Person]] = [:]) {
        self.direction = direction
        self.currentFloor = currentFloor
        self.targetFloors = targetFloors
    }

    func updatePosition(calledFloor: [Int]) {
        guard !calledFloor.isEmpty else { return }
        self.calledFloor = calledFloor
        if direction == nil {
            direction = calledFloor[0] > currentFloor ? .up : .down
        }
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

    func load(people: [Person]) {
        for person in people {
            if targetFloors[person.target] != nil {
                targetFloors[person.target]?.append(person)
            } else {
                targetFloors[person.target] = [person]
            }
        }
        switch direction {
        case .up:
            var floorsAbove = targetFloors.keys.filter {$0 > currentFloor}
            floorsAbove.append(contentsOf: calledFloor.filter {$0 > currentFloor})
            if floorsAbove.isEmpty {direction = .down}
        case .down:
            var floorsBellow = targetFloors.keys.filter {$0 < currentFloor}
            floorsBellow.append(contentsOf: calledFloor.filter {$0 < currentFloor})
            if floorsBellow.isEmpty {direction = .up}
        default:
            break
        }
    }

    func totalPassengers() -> Int {
        return targetFloors.keys.reduce(0, { initial, index in
            initial + (targetFloors[index]?.count ?? 0)
        })
    }

}
