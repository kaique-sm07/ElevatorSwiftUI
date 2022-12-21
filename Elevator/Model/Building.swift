//
//  Building.swift
//  Elevator
//
//  Created by Kaique Monteiro on 15/12/22.
//

import Foundation

class Building: ObservableObject {
    @Published var floors: [Floor] = []
    @Published var elevators: [Elevator] = []
    private var mainTimer: Timer?

    init(numberOfFloors: Int, numberOfElevators: Int) {
        self.floors = (0..<numberOfFloors).map { number in Floor(number: number, people: [], elevatorCalled: false, desiredDirection: nil)}
        self.elevators = (0..<numberOfElevators).map { number in SimpleElevator(direction: nil)}
    }

    func start() {
        mainTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            self.tick()
        }
    }

    private func tick() {
        var calledFloors: [Int] = []
        randomLoadPerson()
        for floor in floors {
            if floor.elevatorCalled {
                calledFloors.append(floor.number)
            }
        }
        for elevator in elevators {
            elevator.updatePosition(calledFloor: calledFloors)
            elevator.load(people: floors[elevator.currentFloor].people)
            floors[elevator.currentFloor].people = []
            floors[elevator.currentFloor].elevatorCalled = false
        }
        floors.append((Floor(number: 10, people: [], elevatorCalled: false, desiredDirection: nil)))
        floors.remove(at: 10)
    }

    private func randomLoadPerson() {
        var people : [Person] = []
        let floor = Int.random(in: 0..<10)
        let person = Int.random(in: 0...2)
        for _ in 0..<person {
            let person = Person(id: UUID().uuidString, origin: floor, target: Int.random(in: 0...10), arrivingTick: 0, elevatorEntryTick: 0, exitTick: 0)
            people.append(person)

        }
        floors[floor].arrivePeople(people: people)
    }

    func stop() {
        guard let mainTimer else { return }
        mainTimer.invalidate()
    }
}
