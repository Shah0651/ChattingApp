//
//  WelcomeViewController.swift
//  ChattingApp
//
//  Created by md asadullah on 31/05/21.
//  Copyright © 2021 droisys. All rights reserved.
//

import UIKit
import UserNotifications

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//MARK: - For local notification
        let center = UNUserNotificationCenter.current()    // Reference for notification center.
        center.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
        }
        
        // Creating notification content.
        let content = UNMutableNotificationContent()
        content.title = "Hey welcome to Flashchat"
        content.body = "Chat with your friends, Happy chatting😊"
        
        // Creating notification trigger
        let date = Date().addingTimeInterval(5)
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        // Creating the request
        let uuidString = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
        
        //Registering the request.
        center.add(request) { (error) in
            // Check the error parameter and handle any errors
        }
        
//MARK: - For animation
        titleLabel.text = ""
        var charIndex = 0
        let titleText = K.appName
        for letter in titleText {
//            print("--")
//            print(0.1 * Double(charIndex))
//            print(letter)
            Timer.scheduledTimer(withTimeInterval: 0.1 * Double(charIndex), repeats: false) { (timer) in
                self.titleLabel.text?.append(letter)
                
            }
            charIndex += 1
        }
        
    }
}
