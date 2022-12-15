//
//  Floor.swift
//  Elevator
//
//  Created by Kaique Monteiro on 15/12/22.
//

import Foundation

protocol Floor {
    var number: Int { get set }
    var people: [any Person] { get set }
    var elevatorCalled: Bool { get set }
    var desiredDirection: Direction { get set }
}
