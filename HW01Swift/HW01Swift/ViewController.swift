//
//  ViewController.swift
//  HW01Swift
//
//  Created by Kirill on 31/12/2023.
//  Copyright © 2023 Kirill. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = "Login ViewController"
        setupUI()
    }

    private var logo: UIImageView = {
        let logo = UIImageView(image:UIImage(named: "catLogo"))
        logo.frame = CGRect(x:200, y:200, width: 200, height: 200)
        return logo
    }()

    private var labelLogo: UILabel = {
        let label = UILabel()
        label.text = "Авторизация"
        label.textAlignment = .center
        label.textColor = .yellow
        label.backgroundColor = .black
        return label
    }()
    
    private var textFieldLogin: UITextField = {
        let textField = UITextField()
        textField.text = "Логин"
        textField.textColor = .black
        textField.textAlignment = .center
        textField.backgroundColor = .white
        return textField
    }()
    
    private var textFieldPassword: UITextField = {
        let textField = UITextField()
        textField.text = "Пароль"
        textField.textColor = .black
        textField.textAlignment = .center
        textField.backgroundColor = .white
        return textField
    }()
    private var enterButton: UIButton = {
        let button = UIButton()
        button.setTitle("Войти", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .yellow
        
        return button
    }()
    
    
    private func setupUI() {
        view.addSubview(logo)
        view.addSubview(labelLogo)
        view.addSubview(textFieldLogin)
        view.addSubview(textFieldPassword)
        view.addSubview(enterButton)
        
        addConstraints()
    }
    
    private func addConstraints() {
        logo.translatesAutoresizingMaskIntoConstraints = false
        labelLogo.translatesAutoresizingMaskIntoConstraints = false
        textFieldLogin.translatesAutoresizingMaskIntoConstraints = false
        textFieldPassword.translatesAutoresizingMaskIntoConstraints = false
        enterButton.translatesAutoresizingMaskIntoConstraints = false
//    myButton.translatesAutoresizingMaskIntoConstraints = false
//    myButton2.translatesAutoresizingMaskIntoConstraints = false
//
    NSLayoutConstraint.activate([
        
        logo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
        logo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        logo.widthAnchor.constraint(equalToConstant: 200),
        logo.heightAnchor.constraint(equalToConstant: 200),
        
        labelLogo.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 10),
        labelLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        labelLogo.widthAnchor.constraint(equalToConstant: view.frame.size.width - 40),
        labelLogo.heightAnchor.constraint(equalToConstant: 40),
        
        textFieldLogin.topAnchor.constraint(equalTo: labelLogo.bottomAnchor, constant: 10),
        textFieldLogin.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        textFieldLogin.widthAnchor.constraint(equalToConstant: view.frame.size.width/3),
        textFieldLogin.heightAnchor.constraint(equalToConstant: 20),
        
        textFieldPassword.topAnchor.constraint(equalTo: textFieldLogin.bottomAnchor, constant: 10),
        textFieldPassword.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        textFieldPassword.widthAnchor.constraint(equalToConstant: view.frame.size.width/3),
        textFieldPassword.heightAnchor.constraint(equalToConstant: 20),
        
        enterButton.topAnchor.constraint(equalTo: textFieldPassword.bottomAnchor, constant: 28),
        enterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        enterButton.widthAnchor.constraint(equalToConstant: view.frame.size.width/3),
        enterButton.heightAnchor.constraint(equalToConstant: 20)
    ])
    

    }

}

