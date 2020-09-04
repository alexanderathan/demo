//
//  RegisterButtonView.swift
//  Demo
//
//  Created by Alexandros Athanasiadis on 3/9/20.
//  Copyright © 2020 Alexandros Athanasiadis. All rights reserved.
//

import UIKit

protocol RegisterButtonViewDelegate: class {
    func didPressRegisterButton()
}

class RegisterButtonView: UIView {

    @IBOutlet var contentView: UIView!
    weak var delegate: RegisterButtonViewDelegate?
    @IBOutlet weak var registerButton: UIButton!
    @IBAction func registerButtonPressed(_ sender: UIButton) {
        guard let delegate = delegate else { return }
        delegate.didPressRegisterButton()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit() {
        Bundle.main.loadNibNamed(Constants.registerButtonViewNibName, owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        registerButton.setTitle(Constants.registerButtonTitle, for: .normal)
    }

}
