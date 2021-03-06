//
//  ViewController.swift
//  Countries
//
//  Created by Alok N on 30/04/21.
//

import UIKit

class ViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    var countryNames: [Country] = NSLocale.isoCountryCodes.map {
        let id = NSLocale.localeIdentifier(fromComponents: [NSLocale.Key.countryCode.rawValue:$0])
        let countryName = NSLocale(localeIdentifier: "en_UK").displayName(forKey: NSLocale.Key.identifier, value: id)
        return Country(countryID: id, countryName: countryName ?? "India", countryEmoji: id.flagFromCode, labelString: "\(id.flagFromCode) \(countryName ?? "Error")")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countryNames.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: "countryViewCell") else {
            fatalError("Error Populating TableViewCell")
        }
        cell.textLabel?.text = countryNames[indexPath.row].labelString
        return cell
    }

}
