//
//  MainViewController.swift
//  RootControllerNavigationDemo01
//
//  Created by Masato Takamura on 2021/05/05.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
        title = "Main Screen"
        let logoutButton = UIBarButtonItem(title: "Log Out", style: .plain, target: self, action: #selector(logout))
        navigationItem.setLeftBarButton(logoutButton, animated: true)
    }
    
    @objc private func logout() {
        
        //ユーザーセッションをクリアする
        UserDefaults.standard.set(false, forKey: "isLogin")
        
        //ログイン画面へ遷移
        SceneDelegate.shared.rootViewController.switchToLogin()
    }
    


}
