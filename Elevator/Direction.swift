//
//  Direction.swift
//  Elevator
//
//  Created by Kaique Monteiro on 15/12/22.
//

import Foundation

struct Direction: OptionSet {
    let rawValue: Int

    static let up = Direction(rawValue: 1 << 1)
    static let down = Direction(rawValue: 1 << -1)
    static let stopped = Direction(rawValue: 1 << 0)
}
