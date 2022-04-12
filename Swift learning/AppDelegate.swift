//
//  AppDelegate.swift
//  Swift learning
//
//  Created by Ethan on 2022/03/29.
//

// AppDelegate 기능
    // 1. 앱의 중요한 데이터 초기화
    // 2. 앱의 scene 환경 설정
    // 3. 앱 밖에서 발생한 알림(배터리부족, 다운로드 완료 등)에 대응
    // 4. 특정한 scene, view, view, controller에 한정하지 않고 앱자체 타겟 이벤트에 대응
    // 5. 푸시 알림 서비스 같은 실행 시 요구되는 서비스 등록

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

