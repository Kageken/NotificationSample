//
//  ViewController.swift
//  NotificationSample
//
//  Created by 陰山賢太 on 2018/10/26.
//  Copyright © 2018 Kageken. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 通知許可ダイアログを表示
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
            // エラー処理
            print(error!)
        }

        // 通知内容の設定
        let content = UNMutableNotificationContent()
        content.title = NSString.localizedUserNotificationString(forKey: "Title", arguments: nil)
        content.body = NSString.localizedUserNotificationString(forKey: "Message", arguments: nil)
        content.sound = UNNotificationSound.default

        // 日時指定でトリガーを作成
        var fireDate = DateComponents()
        fireDate.hour = 20
        fireDate.minute = 15
        fireDate.second = 30
        let trigger = UNCalendarNotificationTrigger(dateMatching: fireDate, repeats: false)

        // 通知リクエストを作成
        let request = UNNotificationRequest(identifier: "id", content: content, trigger: trigger)

        // 通知を登録
        center.add(request) { (error) in
            print(error!)
        }

    }
}
