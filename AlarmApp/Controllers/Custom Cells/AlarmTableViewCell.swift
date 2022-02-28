//
//  AlarmTableViewCell.swift
//  AlarmApp
//
//  Created by Mehdi MMS on 28/02/2022.
//

import UIKit

protocol AlarmTableViewCellDelegate: class{

    func alarmWasToggled(sender: AlarmTableViewCell)
}


class AlarmTableViewCell: UITableViewCell {

    //MARK: - Outlets
    @IBOutlet weak var alarmTitleLabel: UILabel!
    @IBOutlet weak var alarmFireDateLabel: UILabel!
    @IBOutlet weak var isEnabledSwitch: UISwitch!

    weak var delegate: AlarmTableViewCellDelegate?

    //MARK: - Helper Functions
   func updateViews(with alarm: Alarm) {
        alarmTitleLabel.text = alarm.title
    /// We can be confident with `Force Unwrapping` the `fireDate` because a alarm can not be created without one.
        alarmFireDateLabel.text = alarm.fireDate!.stringValue()
        isEnabledSwitch.isOn = alarm.isEnabled
    }

    //MARK: - Actions
    @IBAction func isEnabledSwitchToggled(_ sender: Any) {
        /// This is the call to action for the delegate. Hey intern, go get me a coffee
        delegate?.alarmWasToggled(sender: self)
    }
}
