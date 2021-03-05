//
//  ViewController.swift
//  Qual a boa
//
//  Created by Bruno Vavretchek Lourenco on 22/02/21.
//  Copyright © 2021 Bruno Vavretchek Lourenco. All rights reserved.
//

import UIKit
import MapKit
import Lottie

class RegistrationViewController: UIViewController {
    
    var coordinator: MainCoordinator?
    
    var animationView: AnimationView?
    
    private lazy var heightStackViewConstraint = self.stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: +60)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewTapped()
        setupScreen()
        setupViews()
        setConstraints()
        showWelcomeAnimation()
    }
    
    private func setupScreen() {
        self.view.backgroundColor = .systemGreen
        self.title = "Faz o cadastro aí"
    }
    
    private func setupViews() {
        self.view.addSubview(self.stackView)
        self.viewTapped()
    }
    
    private func viewTapped() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @objc private func handleTap(sender: UITapGestureRecognizer) {
        if textFieldLogin.isFirstResponder || textFieldSenha.isFirstResponder {
            self.heightStackViewConstraint.constant = +85
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.8, options: .curveEaseIn, animations: {
                self.view.layoutIfNeeded()
                self.textFieldLogin.resignFirstResponder()
                self.textFieldSenha.resignFirstResponder()
            }, completion: nil)
        }
    }
    
    private func showWelcomeAnimation() {
        self.animationView = AnimationView()
        animationView?.translatesAutoresizingMaskIntoConstraints = false
        animationView?.animation = Animation.named("26873-moving")
        animationView?.frame = view.bounds
        animationView?.loopMode = .loop
        animationView?.play()
        view.addSubview(animationView!)
        animationView?.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        animationView?.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        animationView?.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: -20).isActive = true
    }
    
    private func showAnimationLoad() {
        self.animationView = AnimationView()
        animationView?.animation = Animation.named("13498-new-year-party")
        animationView?.frame = view.bounds
        UIView.animate(withDuration: 1.5, delay: 0, usingSpringWithDamping: 1.8, initialSpringVelocity: 1.8, options: .curveEaseIn, animations: {
            self.animationView?.backgroundColor = UIColor.black.withAlphaComponent(0.76)
        }, completion: nil)
        animationView?.loopMode = .loop
        animationView?.play()
        view.addSubview(animationView!)
    }
    
    private func setConstraints() {
        self.textFieldLogin.heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.textFieldLogin.widthAnchor.constraint(equalToConstant: 190).isActive = true
        //
        self.textFieldSenha.heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.textFieldSenha.widthAnchor.constraint(equalToConstant: 190).isActive = true
        //
        self.loginButton.widthAnchor.constraint(equalToConstant: 145).isActive = true
        self.loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        //
        self.stackView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        self.stackView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        self.stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.heightStackViewConstraint.isActive = true
        //
    }
    
    @objc private func loginButtonTapped() {
        self.heightStackViewConstraint.constant = +85
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.8, options: .curveEaseIn, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
        let textFields = [self.textFieldLogin, self.textFieldSenha]
        textFields.forEach { (textField) in
            textField.resignFirstResponder()
        }
        showAnimationLoad()
    }
    
    private lazy var textFieldLogin: UITextField = {
        let textFieldLogin = UITextField()
        textFieldLogin.translatesAutoresizingMaskIntoConstraints = false
        textFieldLogin.layer.cornerRadius = 3.7
        textFieldLogin.textAlignment = .center
        textFieldLogin.placeholder = "Usuário"
        textFieldLogin.backgroundColor = .white
        textFieldLogin.borderStyle = .line
        textFieldLogin.delegate = self
        
        return textFieldLogin
    }()
    
    private lazy var textFieldSenha: UITextField = {
        let textFieldSenha = UITextField()
        textFieldSenha.isSecureTextEntry = true
        textFieldSenha.translatesAutoresizingMaskIntoConstraints = false
        textFieldSenha.layer.cornerRadius = 3.7
        textFieldSenha.textAlignment = .center
        textFieldSenha.placeholder = "Senha"
        textFieldSenha.backgroundColor = .white
        textFieldSenha.borderStyle = .line
        textFieldSenha.delegate = self
        
        return textFieldSenha
    }()
    
    private lazy var loginButton: UIButton = {
        let loginButton = UIButton()
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.layer.cornerRadius = 3.8
        loginButton.titleLabel?.font = UIFont(name: "Arial", size: 19)
        loginButton.setTitle("Entrar", for: .normal)
        loginButton.setTitleColor(.systemGreen, for: .normal)
        loginButton.backgroundColor = .white
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        
        return loginButton
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.textFieldLogin, self.textFieldSenha, self.loginButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .systemBlue
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
}

extension RegistrationViewController: UITextFieldDelegate {
    internal func textFieldDidBeginEditing(_ textField: UITextField) {
        self.heightStackViewConstraint.constant = -85
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.8, options: .curveEaseIn, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    internal func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print(string)
        
        return true
    }
    
    internal func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        self.heightStackViewConstraint.constant = +85
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.8, options: .curveEaseIn, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
        return true
    }
}
