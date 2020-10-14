//
//  CodeView.swift
//  ViewCodeExample
//
//  Created by Valmir Junior on 13/10/20.
//

import Foundation

protocol CodeView {
    
    func setup()
    
    func setupComponents()
    
    func setupConstraints()
    
    func setupExtraConfigurations()
}

extension CodeView {
    
    func setup() {
        setupComponents()
        setupConstraints()
        setupExtraConfigurations()
    }
}
