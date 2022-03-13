//
//  CalculatorOperationModel.swift
//  CalculatorIOS
//
//  Created by Yerassyl on 13.03.2022.
//

import Foundation

enum CalculatorOperationType: Int {
    case zero
    case dot
    case equal
    case one
    case two
    case three
    case plus
    case four
    case five
    case six
    case minus
    case seven
    case eight
    case nine
    case multple
    case clear
    case minusPlases
    case persent
    case divide
}

extension CalculatorOperationType {
    func getIntNumber() -> Int {
        switch self {
        case .zero:
            return 0
        case .equal:
            return 0
        case .one:
            return 1
        case .two:
            return 2
        case .three:
            return 3
        case .four:
            return 4
        case .five:
            return 5
        case .six:
            return 6
        case .seven:
            return 7
        case .eight:
            return 8
        case .nine:
            return 9
        default:
            return 0
        }
    }
}
