//
//  ViewController.swift
//  HW01Swift
//
//  Created by Kirill on 31/12/2023.
//  Copyright © 2023 Kirill. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    

    
    private lazy var webView: WKWebView = {
        let webView = WKWebView(frame: view.bounds)
        webView.navigationDelegate = self as WKNavigationDelegate
        return webView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .white
        title = "ViewController"
        setupViews()
        
        guard let url = URL(string: "https://oauth.vk.com/authorize?client_id=51845933&redirect_uri=https://oauth.vk.com/&scope=262150&display=mobile&response_type=token") else {
            return
        }
        
        webView.load(URLRequest(url: url))
        
        /*
        friends +2
        photos +4
         groups(+ 262 144)
        
 */
        
//        networkService.getFriends()
    }
    
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = Theme.currentTheme.backgroundColor
    }
    
    private func setupViews() {
        view.addSubview(webView)
    }
//
    
//    private var logo: UIImageView = {
//        let logo = UIImageView(image:UIImage(named: "catLogo"))
//        logo.frame = CGRect(x:200, y:200, width: 200, height: 200)
//        return logo
//    }()

//    private var labelLogo: UILabel = {
//        let label = UILabel()
//        label.text = "Авторизация"
//        label.textAlignment = .center
//        label.textColor = .yellow
//        label.backgroundColor = .black
//        return label
//    }()
//
//    private var textFieldLogin: UITextField = {
//        let textField = UITextField()
//        textField.text = "Логин"
//        textField.textColor = .black
//        textField.textAlignment = .center
//        textField.backgroundColor = .white
//        return textField
//    }()
//
//    private var textFieldPassword: UITextField = {
//        let textField = UITextField()
//        textField.text = "Пароль"
//        textField.textColor = .black
//        textField.textAlignment = .center
//        textField.backgroundColor = .white
//        return textField
//    }()
//    private var enterButton: UIButton = {
//        let button = UIButton()
//        button.setTitle("Войти", for: .normal)
//        button.setTitleColor(.black, for: .normal)
//        button.backgroundColor = .yellow
//        button.addTarget(self, action: #selector(tap), for: .touchUpInside)
//        return button
//    }()
//
//
//    private func setupUI() {
//        view.addSubview(logo)
//        view.addSubview(labelLogo)
//        view.addSubview(textFieldLogin)
//        view.addSubview(textFieldPassword)
//        view.addSubview(enterButton)
//
//        addConstraints()
//    }
    
//    private func addConstraints() {
//        logo.translatesAutoresizingMaskIntoConstraints = false
//        labelLogo.translatesAutoresizingMaskIntoConstraints = false
//        textFieldLogin.translatesAutoresizingMaskIntoConstraints = false
//        textFieldPassword.translatesAutoresizingMaskIntoConstraints = false
//        enterButton.translatesAutoresizingMaskIntoConstraints = false
////    myButton.translatesAutoresizingMaskIntoConstraints = false
////    myButton2.translatesAutoresizingMaskIntoConstraints = false
////
//    NSLayoutConstraint.activate([
//
//        logo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
//        logo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//        logo.widthAnchor.constraint(equalToConstant: 200),
//        logo.heightAnchor.constraint(equalToConstant: 200),
//
//        labelLogo.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 10),
//        labelLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//        labelLogo.widthAnchor.constraint(equalToConstant: view.frame.size.width - 40),
//        labelLogo.heightAnchor.constraint(equalToConstant: 40),
//
//        textFieldLogin.topAnchor.constraint(equalTo: labelLogo.bottomAnchor, constant: 10),
//        textFieldLogin.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//        textFieldLogin.widthAnchor.constraint(equalToConstant: view.frame.size.width/3),
//        textFieldLogin.heightAnchor.constraint(equalToConstant: 20),
//
//        textFieldPassword.topAnchor.constraint(equalTo: textFieldLogin.bottomAnchor, constant: 10),
//        textFieldPassword.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//        textFieldPassword.widthAnchor.constraint(equalToConstant: view.frame.size.width/3),
//        textFieldPassword.heightAnchor.constraint(equalToConstant: 20),
//
//        enterButton.topAnchor.constraint(equalTo: textFieldPassword.bottomAnchor, constant: 28),
//        enterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//        enterButton.widthAnchor.constraint(equalToConstant: view.frame.size.width/3),
//        enterButton.heightAnchor.constraint(equalToConstant: 20)
//    ])
//    }

    private func tap() {
        let tab1 = UINavigationController(rootViewController: FriendsViewController())
        let tab2 = UINavigationController(rootViewController: GroupsViewController())
        let tab3 = UINavigationController(rootViewController: PhotosViewController(collectionViewLayout: UICollectionViewFlowLayout()))
        
        
        tab1.tabBarItem.title = "Friends"
        tab2.tabBarItem.title = "Groups"
        tab3.tabBarItem.title = "Photos"
        
        let controlers = [tab1, tab2, tab3]
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = controlers
        
//        navigationController?.pushViewController(TabBarController(), animated: true)
        guard let firstScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
            let firstWindow = firstScene.windows.first else {
                return
        }
        
        firstWindow.rootViewController = tabBarController
    }
}

extension ViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        guard let url = navigationResponse.response.url, url.path == "/blank.html", let fragment = url.fragment
            else {
                decisionHandler(.allow)
                return
        }
        let params = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=") }
            .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
        }
        
//        NetworkService.token = params["access_token"]!
         NetworkService.token = params["access_token"] ?? ""
        print(NetworkService.token)

        decisionHandler(.cancel)
        
        webView.removeFromSuperview()
        
        tap()
    }
}
