//
//  Listener.swift
//  MediumReactiveTest
//
//  Created by Kenneth Dubroff on 10/23/21.
//

import Foundation

class Listener {
    static let shared = Listener()
    
    var dataString: String?
    
    private init() {
        NotificationCenter.default.addObserver(forName: .testKey, object: nil, queue: .main) { [weak self] _ in
            guard let self = self else { return }
            print("test data received: \(self.dataString)")
        }
    }
}
