//
//  ViewController.swift
//  RootControllerNavigationDemo01
//
//  Created by Masato Takamura on 2021/05/05.
//

import UIKit

class RootViewController: UIViewController {
    
    //現在のアプリケーションの状態を追跡するために、現在のViewControllerを指す変数を作成
    private var current = UIViewController()
    //private var current: UIViewController
    
    //クラスに初期化子を追加し、アプリの起動後にロードする最初のViewControllerを作成
//    init() {
//        self.current = SplashViewController()
//        super.init(nibName: nil, bundle: nil)
//    }
    
    //スーパークラスでrequiredで定義されているので、サブクラスでも必ず定義しなければならない
//    required init?(coder aCoder: NSCoder) {
//        self.current = aCoder.decodeObject() as? SplashViewController
//        super.init(coder: aCoder)
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //viewをロードするとすぐにSplashViewControllerが呼ばれる
        current = SplashViewController()
        
        //子ViewControllerを追加
        addChild(current)
        //フレームを調整
        current.view.frame = view.bounds
        //新しいsubViewを追加
        view.addSubview(current.view)
        current.didMove(toParent: self)
        
    }
    
//    func showLoginScreen() {
//
//        //LoginViewControllerを作成
//        let loginViewController = LoginViewController()
//        let new = UINavigationController(rootViewController: loginViewController)
//        //それを子ViewControllerとして追加
//        addChild(new)
//        //フレームを位置合わせ
//        new.view.frame = view.bounds
//        //そのビューをサブビューとして追加
//        view.addSubview(new.view)
//        //didMoveを呼び出し
//        new.didMove(toParent: self)
//
//        //willMoveを呼び出して、現在の子ViewControllerを削除する準備
//        current.willMove(toParent: nil)
//        //現在のビューをスーパービューから削除
//        current.view.removeFromSuperview()
//        //現在の子ViewControllerを親であるRootViewControllerから削除
//        current.removeFromParent()
//
//        //現在のviewControllerを更新することを忘れずに。
//        current = new
//
//    }
    
    func switchToMainScreen() {
        
        let mainViewController = MainViewController()
        let new = UINavigationController(rootViewController: mainViewController)
        animateFadeTransition(to: new)
    }
    
    //遷移をアニメートする
    private func animateFadeTransition(to new: UIViewController, completion: (() -> Void)? = nil) {
        
        //現在の子ViewControllerを削除する前に呼ばれる
        current.willMove(toParent: nil)
        //新たなViewControllerを子ViewControllerに追加する
        addChild(new)
        //ページ遷移
        transition(from: current, to: new, duration: 0.3, options: [.transitionCrossDissolve, .curveEaseOut], animations: {}) { (completed) in
            
            //現在の子ViewControllerを親ViewControllerから切り離す
            self.current.removeFromParent()
            //新たなViewControllerを追加した後に呼び出す
            new.didMove(toParent: self)
            //現在の子ViewControllerを更新
            self.current = new
            //完了
            completion?()
            
        }
    }
    
    //ログイン画面へ遷移する
    func switchToLogin() {
        
        let loginViewController = LoginViewController()
        let new = UINavigationController(rootViewController: loginViewController)
        animateDismissTransition(to: new)
        
    }
    
    private func animateDismissTransition(to new: UIViewController, completion: (() -> Void)? = nil) {
        
        let initialFrame = CGRect(x: -view.bounds.width, y: 0, width: view.bounds.width, height: view.bounds.height)
        current.willMove(toParent: nil)
        addChild(new)
        
        transition(from: current, to: new, duration: 0.3, options: [], animations: {
            new.view.frame = self.view.bounds
        }) { (completed) in
            self.current.removeFromParent()
            new.didMove(toParent: self)
            self.current = new
            completion?()
        }
        
    }
}

