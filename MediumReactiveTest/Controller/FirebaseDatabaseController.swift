//
//  FirebaseDatabaseController.swift
//  MediumReactiveTest
//
//  Created by Kenneth Dubroff on 10/23/21.
//

import FirebaseDatabase

class FirebaseDatabaseController {
    private let db = Database.database().reference()
    
    func observe(endpoint: String, event: DataEventType = .value, completion: @escaping (DataSnapshot) -> Void) {
        let ref = db.child(endpoint)
        ref.observe(event, with: completion)
    }
}
