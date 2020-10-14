//
//  WelcomeButton.swift
//  ViewCodeExample
//
//  Created by Valmir Junior on 13/10/20.
//

import UIKit

final class WelcomeButton: UIButton {
    enum Style {
        case main, secondary
    }
    
    var style: Style = .main
    var title: String = ""
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(style: Style, title: String) {
        self.init(frame: .zero)
        self.style = style
        self.title = title
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func commonInit() {
        let titleColor: UIColor
        let bgColor: UIColor
        
        switch style {
        case .main:
            titleColor = .mainButtonText
            bgColor = .mainButton
        case .secondary:
            titleColor = .secondaryButtonText
            bgColor = .secondaryButton
            layer.borderColor = UIColor.secondaryButtonBorder.cgColor
            layer.borderWidth = 2
        }
        
        backgroundColor = bgColor
        setTitleColor(titleColor, for: .normal)
        setTitle(title, for: .normal)
        layer.cornerRadius = 25
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
    }
}
