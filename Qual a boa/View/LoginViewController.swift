//
//  RegistrationViewController.swift
//  Qual a boa
//
//  Created by Bruno Vavretchek Lourenco on 23/02/21.
//  Copyright © 2021 Bruno Vavretchek Lourenco. All rights reserved.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    var coordinator: MainCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        self.view.backgroundColor = .systemPink
    }
    
}
