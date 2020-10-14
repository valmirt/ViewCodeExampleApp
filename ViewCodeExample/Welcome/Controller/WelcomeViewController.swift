//
//  WelcomeViewController.swift
//  ViewCodeExample
//
//  Created by Valmir Junior on 13/10/20.
//

import UIKit

final class WelcomeViewController: UIViewController {
    
    // MARK: - Properties
    
    // MARK: - Super Methods
    override func loadView() {
        view = WelcomeView(delegate: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Methods
    
}

extension WelcomeViewController: WelcomeViewDelegate {
    func loginButtonTapped(with phone: String) {
        print("Usuário tocou no botão de login com o número \(phone)")
    }
    
    func signupButtonTapped() {
        print("Usuário tocou no botão de sign up")
    }
    
    func facebookButtonTapped() {
        
    }
    
    func googleButtonTapped() {
    
    }
}

