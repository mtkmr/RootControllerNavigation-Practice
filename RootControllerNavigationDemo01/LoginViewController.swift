//
//  LoginViewController.swift
//  RootControllerNavigationDemo01
//
//  Created by Masato Takamura on 2021/05/05.
//

//ユーザーのセッションが無効の場合に、ユーザーを認証するための画面

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        title = "Login Screen"
        let loginButton = UIBarButtonItem(title: "Log In", style: .plain, target: self, action: #selector(login))
        navigationItem.setLeftBarButton(loginButton, animated: true)
    }
    
    
    @objc private func login() {
        //ユーザーセッションを保存する
        UserDefaults.standard.set(true, forKey: "isLogin")
        
        //メイン画面に遷移
        SceneDelegate.shared.rootViewController.switchToMainScreen()
    }
    

}
