//
//  ContactScreenTableViewController.swift
//  ContactList
//
//  Created by Niso on 1/27/21.
//

import UIKit

class ContactScreenTableViewController: UITableViewController {
    
    private var viewModel = ContactScreenViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Contacts"
        
        // Connect to database.
        viewModel.connectToDatabase()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        loadData()
        tableView.reloadData()
    }
    
    // MARK: - Load data from SQLite database
    private func loadData() {
        viewModel.loadDataFromSQLiteDatabase()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRowsInSection(section: section)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...
        let object = viewModel.cellForRowAt(indexPath: indexPath)
        
        if let contactCell = cell as? ContactTableViewCell {
            contactCell.setCellWithValuesOf(object)
        }
        return cell
    }
    
    // Delete cell from table
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let contact = viewModel.cellForRowAt(indexPath: indexPath)
            
            // Delete contact from database table
            SQLiteCommands.deleteRow(contactId: contact.id)
            
            // Updates the UI after delete changes
            self.loadData()
            self.tableView.reloadData()
        }
    }
    
    // MARK: - Navigation

    // Passes selected contact from table cell to NewContactViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Pass the selected object to the new view controller.
        if segue.identifier == "editContact" {
            guard let newContactVC = segue.destination as? NewContactViewController else {return}
            guard let selectedContactCell = sender as? ContactTableViewCell else {return}
            if let indexPath = tableView.indexPath(for: selectedContactCell) {
                let selectedContact = viewModel.cellForRowAt(indexPath: indexPath)
                newContactVC.viewModel = NewContactViewModel(contactValues: selectedContact)
            }
        }
    }
}
