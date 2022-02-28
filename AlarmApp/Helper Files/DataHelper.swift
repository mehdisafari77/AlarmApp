//
//  DataHelper.swift
//  AlarmApp
//
//  Created by Mehdi MMS on 28/02/2022.
//

import Foundation
extension Date {

    /**
     Sets Formatting for our dates. Returns a String

     ## Important Notes ##
     1. This extends a Date; so it is usable on all Date objects
     2. Currently Set to medium Date length
     3. Current Set to medium Time length
     */
    func stringValue() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        return formatter.string(from: self)
    }
}
