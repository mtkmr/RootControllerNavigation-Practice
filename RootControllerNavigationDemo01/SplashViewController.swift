//
//  SplashViewController.swift
//  RootControllerNavigationDemo01
//
//  Created by Masato Takamura on 2021/05/05.
//

import UIKit

class SplashViewController: UIViewController {
    
    private let activityIndicator = UIActivityIndicatorView(style: .large)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(activityIndicator)
        activityIndicator.frame = view.bounds
        activityIndicator.color = .white
        activityIndicator.backgroundColor = UIColor(white: 0.5, alpha: 0.4)
        
        makeServiceCall()
        
    }
    
    //ユーザーセッションを検証するメソッドという想定
    private func makeServiceCall() {
        //APIシュミレートのため、3秒後に止まる遅延処理
        activityIndicator.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(3)) {
            self.activityIndicator.stopAnimating()
            
            if UserDefaults.standard.bool(forKey: "isLogin") {
                //メイン画面へ
                SceneDelegate.shared.rootViewController.switchToMainScreen()
            } else {
                //ログイン画面へ
                SceneDelegate.shared.rootViewController.switchToLogin()
            }
            
        }
        
    }
}
