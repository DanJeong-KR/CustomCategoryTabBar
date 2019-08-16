//
//  AppDelegate.swift
//  CustomCategoryTabBar
//
//  Created by chang sic jung on 16/07/2019.
//  Copyright © 2019 chang sic jung. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?


  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.backgroundColor = .white
    window?.makeKeyAndVisible()
    
    let vc = DemoViewController(withTitles: ["Yellow", "Red", "Blue", ],
                               withViews: [FirstDemoView(), SecondDemoView(), ThirdDemoView()])
    
    window?.rootViewController = vc
    
    return true
  }


}

