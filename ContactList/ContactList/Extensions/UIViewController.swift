//
//  UIViewController.swift
//  ContactList
//
//  Created by Niso on 1/26/21.
//

import UIKit

extension UIViewController {
    // Alert message
    func showError(_ title: String?, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        present(alertController, animated: true, completion: nil)
    }
}
