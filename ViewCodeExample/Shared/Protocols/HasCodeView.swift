//
//  HasCodeView.swift
//  ViewCodeExample
//
//  Created by Valmir Junior on 13/10/20.
//

import UIKit

protocol HasCodeView {
    associatedtype CustomView: UIView
}

extension HasCodeView where Self: UIViewController {
    var customView: CustomView? {
        return view as? CustomView
    }
}
