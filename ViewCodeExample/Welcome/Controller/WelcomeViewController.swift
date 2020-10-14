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
        
    }
    
    func signupButtonTapped() {
        
    }
    
    func facebookButtonTapped() {
        
    }
    
    func googleButtonTapped() {
    
    }
}

