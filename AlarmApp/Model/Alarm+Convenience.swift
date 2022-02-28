//
//  Alarm+Convenience.swift
//  AlarmApp
//
//  Created by Mehdi MMS on 28/02/2022.
//

import Foundation
import CoreData

extension Alarm {
    
    convenience init(title: String, isEnabled: Bool, fireDate: Date, uuidString: String = UUID().uuidString, context: NSManagedObjectContext = CoreDataStack.context) {

        self.init(context: context)
        self.title = title
        self.isEnabled = isEnabled
        self.fireDate = fireDate
        self.uuidString = uuidString

    }
}
