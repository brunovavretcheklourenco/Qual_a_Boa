//
//  LoginViewController.swift
//  Qual a boa
//
//  Created by Bruno Vavretchek Lourenco on 23/02/21.
//  Copyright © 2021 Bruno Vavretchek Lourenco. All rights reserved.
//

import Foundation
import UIKit
import MapKit


class HomeViewController: UIViewController {
    
    var coordinator: MainCoordinator?
    private static var locationHelper: LocationManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupScreen()
        setConstraints()
    }
    
    private func setupScreen() {
        let add = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: nil)
               navigationItem.rightBarButtonItems = [add]
        
        self.title = "Qual a boa?"
        self.view.backgroundColor = .white
        HomeViewController.locationHelper = LocationManager()
    }
    
    private func setupViews() {
        self.view.addSubview(self.button)
        self.view.addSubview(self.secondButton)
        self.view.addSubview(self.mapView)
    }
    
    private func setConstraints() {
        self.mapView.heightAnchor.constraint(equalToConstant: 660).isActive = true
        self.mapView.safeAreaLayoutGuide.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        self.mapView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        self.mapView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        self.button.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 40).isActive = true
        self.button.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -50).isActive = true
        self.button.widthAnchor.constraint(equalToConstant: 120).isActive = true
        self.button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.secondButton.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -50).isActive = true
        self.secondButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -50).isActive = true
        self.secondButton.widthAnchor.constraint(equalToConstant: 120).isActive = true
        self.secondButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    lazy var mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.delegate = self
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.showsUserLocation = true
        return mapView
    }()
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 2.7
        button.setTitle("Entrar", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button
    }()
    
    lazy var secondButton: UIButton = {
        let secondButton = UIButton()
        secondButton.backgroundColor = .black
        secondButton.layer.masksToBounds = true
        secondButton.layer.cornerRadius = 2.7
        secondButton.setTitle("Registrar", for: .normal)
        secondButton.setTitleColor(.systemBlue, for: .normal)
        secondButton.translatesAutoresizingMaskIntoConstraints = false
        secondButton.addTarget(self, action: #selector(secondButtonAction), for: .touchUpInside)
        return secondButton
    }()
    
    @objc func buttonAction() {
        coordinator?.showLoginVc()
    }
    
    @objc func secondButtonAction() {
        coordinator?.showRegistrationVc()
    }
}

extension HomeViewController : MKMapViewDelegate{
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        var region = MKCoordinateRegion()
        region.span = MKCoordinateSpan(latitudeDelta: 0.0030, longitudeDelta: 0.0030)
        let coordinate = CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude:  userLocation.coordinate.longitude)
        region.center = coordinate
        mapView.setRegion(region, animated: true)
    }
}
