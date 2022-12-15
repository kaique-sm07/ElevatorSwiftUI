//
//  Person.swift
//  Elevator
//
//  Created by Kaique Monteiro on 15/12/22.
//

import Foundation

protocol Person : Hashable {
    var id: String { get set }
    var origin: Int { get set }
    var target: Int { get set }
    var arrivingTick: Int { get set }
    var elevatorEntryTick: Int { get set }
    var exitTick: Int { get set }

}
