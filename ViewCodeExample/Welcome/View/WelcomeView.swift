//
//  WelcomeView.swift
//  ViewCodeExample
//
//  Created by Valmir Junior on 13/10/20.
//

import UIKit

protocol WelcomeViewDelegate: class {
    func loginButtonTapped(with phone: String)
    
    func signupButtonTapped()
    
    func facebookButtonTapped()
    
    func googleButtonTapped()
}

final class WelcomeView: UIView, CodeView {
    
    //MARK: - Properties
    weak var delegate: WelcomeViewDelegate?
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: .zero)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.keyboardDismissMode = .interactive
        return scrollView
    }()
    
    let contentView: UIView = {
        let content = UIView(frame: .zero)
        content.translatesAutoresizingMaskIntoConstraints = false
        return content
    }()
    
    let mainImage: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = #imageLiteral(resourceName: "home")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = Localization.welcome
        label.textAlignment = .center
        label.font = .title
        label.textColor = .title
        label.accessibilityIdentifier = Localization.welcomeAccessibility
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let subtitleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = Localization.mainSubtitle
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .body
        label.textColor = .body
        label.accessibilityIdentifier = Localization.mainSubtitle
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let phoneTextField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.placeholder = Localization.phoneHint
        textField.borderStyle = .roundedRect
        textField.keyboardType = .phonePad
        textField.textAlignment = .center
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let buttonStackView: UIStackView = {
        let stackview = UIStackView(frame: .zero)
        stackview.axis = .horizontal
        stackview.distribution = .fillEqually
        stackview.alignment = .center
        stackview.spacing = Dimens.horizontalSmall
        stackview.translatesAutoresizingMaskIntoConstraints = false
        return stackview
    }()
    
    let loginButton = WelcomeButton(style: .main, title: Localization.login)
    let signupButton = WelcomeButton(style: .secondary, title: Localization.signup)
    
    //MARK: - Super Methods
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    init(delegate: WelcomeViewController) {
        super.init(frame: .zero)
        self.delegate = delegate
        setup()
    }
    
    //MARK: - Methods
    func setupComponents() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(mainImage)
        contentView.addSubview(titleLabel)
        contentView.addSubview(subtitleLabel)
        contentView.addSubview(phoneTextField)
        contentView.addSubview(buttonStackView)
        buttonStackView.addArrangedSubview(loginButton)
        buttonStackView.addArrangedSubview(signupButton)
    }
    
    func setupConstraints() {
        //NSLayoutConstraints - 1 maneira
        //VFL (Visual Format Language) - 2 maneira
        //Layout Anchors - 3 maneira
        scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        scrollView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        contentView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        let contentViewHeightConstraint = contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        contentViewHeightConstraint.priority = .defaultLow
        contentViewHeightConstraint.isActive = true
        
        mainImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Dimens.verticalVeryLarge).isActive = true
        mainImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Dimens.horizontal).isActive = true
        mainImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Dimens.horizontal).isActive = true
        mainImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: mainImage.bottomAnchor, constant: Dimens.verticalVeryLarge).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: mainImage.leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: mainImage.trailingAnchor).isActive = true
        
        subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Dimens.verticalSmall).isActive = true
        subtitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        subtitleLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor).isActive = true
        
        phoneTextField.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: Dimens.verticalLarge).isActive = true
        phoneTextField.leadingAnchor.constraint(equalTo: subtitleLabel.leadingAnchor).isActive = true
        phoneTextField.trailingAnchor.constraint(equalTo: subtitleLabel.trailingAnchor).isActive = true
        
        buttonStackView.topAnchor.constraint(equalTo: phoneTextField.bottomAnchor, constant: Dimens.verticalNormal).isActive = true
        buttonStackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        
        loginButton.widthAnchor.constraint(equalToConstant: 120).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        signupButton.heightAnchor.constraint(equalTo: loginButton.heightAnchor).isActive = true
    }
    
    func setupExtraConfigurations() {
        backgroundColor = .view
        loginButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        signupButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc private func buttonTapped(sender: UIButton) {
        switch sender {
        case loginButton:
            delegate?.loginButtonTapped(with: phoneTextField.text!)
        case signupButton:
            delegate?.signupButtonTapped()
        default:
            break
        }
    }
}
