//
//  CalculatorViewController.swift
//  CalculatorIOS
//
//  Created by Yerassyl on 13.03.2022.
//

import UIKit

protocol CalculatorView: AnyObject {
    func updateLabel(with text: String)
}

class CalculatorViewController: UIViewController {
    
    // MARK: - Public Properties
    
    var presenter: CalculatorPresenter!
    
    // MARK: - Outlets
    @IBOutlet weak var infoLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = CalculatorPresenterImpl(view: self)
        presenter.onViewDidLoad()
    }
}

// MARK: - Actions

private extension CalculatorViewController {
    
    @IBAction func onOperatorButtonDidTap(_ sender: UIButton) {
        presenter.onOperationButtonDidTap(type: CalculatorOperationType(rawValue: sender.tag)!)
    }
}


// MARK: - CalculatorView

extension CalculatorViewController: CalculatorView {
    
    func updateLabel(with text: String) {
        infoLabel.text = text
    }
}
