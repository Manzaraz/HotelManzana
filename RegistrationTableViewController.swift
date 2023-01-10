//
//  RegistrationTableViewController.swift
//  HotelManzana
//
//  Created by Christian Manzaraz on 06/01/2023.
//

import UIKit

class RegistrationTableViewController: UITableViewController {
    
    var registrations: [Registration] = []
    
    @IBAction func unwindFromAddRegistration(unwindSegue: UIStoryboardSegue) {
        
        guard
            let addRegistrationTableViewController = unwindSegue.source as? AddRegistrationTableViewController,
            let registration = addRegistrationTableViewController.registration
        else { return }
        
        // Use data from the view controller which initiated the unwind segue
        registrations.append(registration)
        tableView.reloadData()
    }
    
    @IBSegueAction func showRegistration(_ coder: NSCoder, sender: Any?) -> AddRegistrationTableViewController? {
        let addRegistrationTableViewController = AddRegistrationTableViewController(coder: coder)
        
        guard
            let cell = sender as? UITableViewCell,
            let indexPath = tableView.indexPath(for: cell)
        else { return addRegistrationTableViewController }
        
        let registration = registrations[indexPath.row]
        addRegistrationTableViewController?.existingRegistration = registration
        
        return addRegistrationTableViewController
    }
    
    
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return registrations.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =   tableView.dequeueReusableCell(withIdentifier: "RegistrationCell", for: indexPath)
        
        let registration = registrations[indexPath.row]
        
        // Configure the cell...
        var content = cell.defaultContentConfiguration()
        content.text = "\(registration.firstName) \(registration.lastName)"
        content.secondaryText = "\((registration.checkInDate..<registration.checkOutDate).formatted(date: .numeric, time: .omitted)): \(registration.roomType.name)"
        cell.contentConfiguration = content
        
        return cell
    }
    
    
    
}
