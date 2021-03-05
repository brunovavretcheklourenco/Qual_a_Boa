//
//  MainCoordinator.swift
//  Qual a boa
//
//  Created by Bruno Vavretchek Lourenco on 23/02/21.
//  Copyright © 2021 Bruno Vavretchek Lourenco. All rights reserved.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator & Coordinated {
    var coordinator: Coordinator?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
        
    func start() {
        let homeVC = HomeViewController()
        homeVC.coordinator = self
        self.navigationController.navigationBar.barStyle = .default
        self.navigationController.navigationBar.isTranslucent = false
        self.navigationController.navigationBar.titleTextAttributes = [.foregroundColor: #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)]
        self.navigationController.navigationBar.tintColor = #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)
        self.navigationController.pushViewController(homeVC, animated: true)
    }
    
    func showMainVc() {
    }
    
    func showLoginVc() {
        let cadastroVC = LoginViewController()
        self.navigationController.showDetailViewController(cadastroVC, sender: self)
    }
    
    func showRegistrationVc() {
        let cadastroVC = RegistrationViewController()
        self.coordinator = self
        self.navigationController.pushViewController(cadastroVC, animated: true)
    }
    
}

//Hide StatusBar
extension UINavigationController {
    override open var prefersStatusBarHidden: Bool {
        return true
    }
}

