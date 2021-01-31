//
//  NewContactViewModel.swift
//  ContactList
//
//  Created by Niso on 1/26/21.
//

import UIKit

class NewContactViewModel {
    
    private var contactValues: Contact?
    
    let id: Int?
    let firstName: String?
    let lastName: String?
    let phoneNumber: String?
    let photo: UIImage?
    
    init(contactValues: Contact?) {
        self.contactValues = contactValues
        
        self.id = contactValues?.id
        self.firstName = contactValues?.firstName
        self.lastName = contactValues?.lastName
        self.phoneNumber = contactValues?.phoneNumber
        self.photo = UIImage(data: contactValues!.photo)
        
    }
}
