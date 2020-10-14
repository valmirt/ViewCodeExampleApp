//
//  ViewCodeComponent.swift
//  ViewCodeExample
//
//  Created by Valmir Junior on 13/10/20.
//

import UIKit

@propertyWrapper
struct ViewCodeComponent<T: UIView> {
    var wrappedValue: T
    
    init(wrappedValue: T) {
        self.wrappedValue = wrappedValue
        self.wrappedValue.translatesAutoresizingMaskIntoConstraints = false
    }
}
