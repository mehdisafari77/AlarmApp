//
//  DataHelper.swift
//  AlarmApp
//
//  Created by Mehdi MMS on 28/02/2022.
//

import Foundation
extension Date {

    func stringValue() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        return formatter.string(from: self)
    }
}
