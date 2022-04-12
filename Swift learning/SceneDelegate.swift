//
//  SceneDelegate.swift
//  Swift learning
//
//  Created by Ethan on 2022/03/29.

// 소개 : Scene-Based Life-Cycle관련 내용

//1. IOS13부터는 IOS APP에도 window의 개념이 scene으로 대체가 되었다. 그리고, 여러개의 scene을 가질 수 있다.

//2. 사용자나 시스템이 새로운 scene을 만들게되면, UIKit이 Unattached state로 만든다.

    // Foreground
        // Inactive : 앱이 실행 중인 상태이나, 이벤트를 받지는 않음. Active상태로 넘어가기 전에 앱은 반드시 거치는 상태. 알림같은 특정 알림창이 화면을 덮어서 앱이 event를 받지 못하는 상태
        // Active : 앱이 실행 중이고 이벤트를 받을 수 있는 상태. Foreground 앱의 일반적인 상태
    // Background
        // 앱 사용 중에 다른 앱을 실행하거나 홈화면으로 나갔을 때 상태, 백그라운드에서 동작하는 코드를 추가하면 suspended상태로 넘어가지 않고 백그라운드 상태를 유지 처음부터 background상태로 실행되는 앱은 inactive대신 background상태로 진입. 음악을 실행하고 홈 화면으로 나가도 음악이 나오는 상태
    // Suspend
        // 앱이 background 상태에서 추가적인 작업을 하지 않으면 곧바로 suspended상태로 진입. 앱을 다시 실행할 경우 빠른 실행을 위해 메모리에는 올라가 있음. 메모리가 부족한 상황이 되면 IOS는 suspended상태에 있는 앱들을 메모리에서 해제
            

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

