//
//  UserProfileViewModel.swift
//  Demo
//
//  Created by Alexandros Athanasiadis on 3/9/20.
//  Copyright © 2020 Alexandros Athanasiadis. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

class UserProfileViewModel {

    private let userProfileModel: LoginResponse
    let fullName: String
    let profilePictureURL: URL!

    init(model: LoginResponse) {
        userProfileModel = model
        let firstName = userProfileModel.data?.firstName ?? ""
        let lastName = userProfileModel.data?.lastName ?? ""
        let firstLastNameNoEmpty = [firstName, lastName].filter({ !$0.isEmpty })
        self.fullName = firstLastNameNoEmpty.joined(separator: " ")
        let profilePictureStringUrl = userProfileModel.data?.avatar ?? ""
        let profilePicURL = URL(string: profilePictureStringUrl)
        self.profilePictureURL = profilePicURL
    }

    func configure(cell: UserInfoTableViewCell) {
        cell.fullNameLabel.text = fullName
        cell.profilePictureImageView.sd_imageTransition = .fade
        cell.profilePictureImageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
        cell.profilePictureImageView.sd_imageIndicator = SDWebImageProgressIndicator.`default`
        cell.profilePictureImageView.sd_setImage(with: profilePictureURL,
                                                 placeholderImage: UIImage(named: Constants.profilePicturePlaceholder))
    }

}
