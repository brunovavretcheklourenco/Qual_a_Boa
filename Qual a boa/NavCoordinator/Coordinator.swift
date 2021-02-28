//
//  Coordinator.swift
//  Qual a boa
//
//  Created by Bruno Vavretchek Lourenco on 23/02/21.
//  Copyright © 2021 Bruno Vavretchek Lourenco. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    func start()
}

protocol Coordinated {
    var coordinator: Coordinator? { get set }
}
