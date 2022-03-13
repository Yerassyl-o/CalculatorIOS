//
//  CalculatorPresenter.swift
//  CalculatorIOS
//
//  Created by Yerassyl on 13.03.2022.
//

import Foundation

protocol CalculatorPresenter: AnyObject {
    var view: CalculatorView! { get set }
    
    func onViewDidLoad()
    func onOperationButtonDidTap(type: CalculatorOperationType)
}

final class CalculatorPresenterImpl {
    
    // MARK: - Public properties
    
    weak var view: CalculatorView!
    
    // MARK: - Private Properties
    
    private var digitsContainer: [String] = []
    private var opeationContainer: [CalculatorOperationType] = []
    private var labelText: String = ""
    
    // MARK: - Init
    
    init(view: CalculatorView) {
        self.view = view
    }
    
}

// MARK: - CalculatorPresenter

extension CalculatorPresenterImpl: CalculatorPresenter {
   
    func onViewDidLoad() {
        view.updateLabel(with: "0")
    }
    
    func onOperationButtonDidTap(type: CalculatorOperationType) {
        switch type {
        case .clear:
            clearLabel()
        case .equal:
            if opeationContainer.count > 0 {
                digitsContainer.append(labelText)
                calculate()
            }
        case .dot:
            if !labelText.contains(".") {
                labelText += "."
                view.updateLabel(with: labelText)
            }
        case .plus:
            opeationContainer.append(type)
            saveDigitAndRemoveLabel(type: type)
        case .minus:
            opeationContainer.append(type)
            saveDigitAndRemoveLabel(type: type)
        case .multple:
            opeationContainer.append(type)
            saveDigitAndRemoveLabel(type: type)
        case .divide:
            opeationContainer.append(type)
            saveDigitAndRemoveLabel(type: type)
        case .persent:
            opeationContainer.append(type)
            saveDigitAndRemoveLabel(type: type)
        case .minusPlases:
            if labelText.first == "-" {
                labelText.removeFirst()
            } else {
                labelText.insert("-", at: labelText.index(labelText.startIndex, offsetBy: 0))
            }
            view.updateLabel(with: labelText)
        default:
            updateLabel(type: type)
        }
        print(digitsContainer)
        print(opeationContainer)
    }
}

private extension CalculatorPresenterImpl {
    
    func calculate() {
        var result: Float = Float(digitsContainer[0])!
        print(digitsContainer)
        print(opeationContainer)
        for index in 0 ..< digitsContainer.count {
            if !(index == digitsContainer.count - 1) {
                switch opeationContainer[index] {
                case .minus:
                    result -= Float(digitsContainer[index + 1])!
                case .plus:
                    result += Float(digitsContainer[index + 1])!
                case .multple:
                    result *= Float(digitsContainer[index + 1])!
                case .divide:
                    result /= Float(digitsContainer[index + 1])!
                case .persent:
                    result = result - Float(Int(result))
                case .equal:
                   break
                default :
                    break
                }
            }
        }
        digitsContainer = []
        opeationContainer = []
        digitsContainer.append(String(result))
        if Float(Int(result)) - result == 0 {
            view.updateLabel(with: String(Int(result)))
        } else {
            view.updateLabel(with: String(format: "%5.2f", result))
        }
    }
    
    
    func saveDigitAndRemoveLabel(type: CalculatorOperationType) {
        digitsContainer.append(labelText)
        labelText = "0"
        view.updateLabel(with: labelText)
        if digitsContainer.count == 2 && opeationContainer.count > 0 {
            calculate()
        }
    }
    
    func updateLabel(type: CalculatorOperationType) {
        if labelText.first == "0" && !labelText.contains(".") {
            labelText.removeFirst()
        }
        labelText += String(type.getIntNumber())
        view.updateLabel(with: labelText)
    }
    
    func clearLabel() {
        labelText = "0"
        digitsContainer = []
        opeationContainer = []
        view.updateLabel(with: labelText)
    }
}
