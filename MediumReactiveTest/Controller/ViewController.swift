//
//  ViewController.swift
//  MediumReactiveTest
//
//  Created by Kenneth Dubroff on 10/23/21.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController {   
    let dbController = FirebaseDatabaseController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dbController.observe(endpoint: "test") { snapshot in            
            guard snapshot.exists() else { return }
            let dictionaryValue = snapshot.value as? [String: String]
            let stringValue = dictionaryValue?["name"]
            Listener.shared.dataString = stringValue
            NotificationCenter.default.post(name: .testKey, object: nil)
        }
    }
}

extension Notification.Name {
    static let testKey = Notification.Name.init(rawValue: "testValueNotification")
}
