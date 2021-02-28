//
//  ViewController.swift
//  Qual a boa
//
//  Created by Bruno Vavretchek Lourenco on 22/02/21.
//  Copyright © 2021 Bruno Vavretchek Lourenco. All rights reserved.
//

import UIKit
import MapKit

class RegistrationViewController: UIViewController {
    var coordinator: MainCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupScreen()
    }
    
    private func setupScreen() {
        self.view.backgroundColor = .systemYellow
        self.title = "Faz o cadastro aí"
    }
    
    
}
