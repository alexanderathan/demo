//
//  LogoutTableViewCell.swift
//  Demo
//
//  Created by Alexandros Athanasiadis on 3/9/20.
//  Copyright © 2020 Alexandros Athanasiadis. All rights reserved.
//

import UIKit

protocol LogoutTableViewCellDelegate: class {
    func didPressLogoutButton()
}
class LogoutTableViewCell: UITableViewCell {

    @IBOutlet weak var logoutButton: UIButton!
    
    @IBAction func logoutButtonPressed(_ sender: UIButton) {
        guard let cellDelegate = delegate else { return }
        cellDelegate.didPressLogoutButton()
    }
    
    weak var delegate: LogoutTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        logoutButton.setTitle(Constants.LOGOUT_BUTTON_TITLE, for: .normal)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
