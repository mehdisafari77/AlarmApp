//
//  Alarm+Convenience.swift
//  AlarmApp
//
//  Created by Mehdi MMS on 28/02/2022.
//

import Foundation
import CoreData

extension Alarm {

    /**
     Conveniently Initializes a Alarm object from a context

     - Parameters:
        - title: String value for the title attribute
        - isEnabled: Bool value for the enabled attribute.
        - fireDate: Date value for the fireDate attribute - When the alarm will trigger
        - uuidString: A randomly generated unique identifier. We use this string to keep track of each Alarm `Object`
        - context: The NSManagedObjectContext for the app, default value set to the CoreDataStack class's context property
     */
    convenience init(title: String, isEnabled: Bool, fireDate: Date, uuidString: String = UUID().uuidString, context: NSManagedObjectContext = CoreDataStack.context) {

        self.init(context: context)
        self.title = title
        self.isEnabled = isEnabled
        self.fireDate = fireDate
        self.uuidString = uuidString

    }
}
