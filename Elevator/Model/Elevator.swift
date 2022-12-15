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
