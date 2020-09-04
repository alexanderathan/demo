//
//  LogoutTableViewCell.swift
//  Demo
//
//  Created by Alexandros Athanasiadis on 3/9/20.
//  Copyright © 2020 Alexandros Athanasiadis. All rights reserved.
//

import UIKit

protocol LogoutTableViewCellDelegate: class {
    func didPressLogoutButton(sender: LogoutTableViewCell)
}
class LogoutTableViewCell: UITableViewCell {

    @IBOutlet weak var logoutButton: UIButton!
    @IBAction func logoutButtonPressed(_ sender: UIButton) {
        guard let cellDelegate = delegate else { return }
        cellDelegate.didPressLogoutButton(sender: self)
    }
    weak var delegate: LogoutTableViewCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        logoutButton.setTitle(Constants.logoutButtonTitle, for: .normal)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
