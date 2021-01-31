//
//  UIImageView.swift
//  ContactList
//
//  Created by Niso on 1/26/21.
//

import UIKit

extension UIImageView {
    // Round shaped image
    func makeRounded() {
        self.layer.masksToBounds = false
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
    }
}
