//
//  ViewController.swift
//  Countries
//
//  Created by Alok N on 30/04/21.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: OUTLETS
    @IBOutlet weak var countryTableView: UITableView!
    
    var countryNames:[Country] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countryTableView.delegate = self
        countryTableView.dataSource = self
        countryTableView.separatorStyle = .singleLine
        countryTableView.allowsSelection = false
        loadCountries()
    }
    
    func emojiFromCode(code: String) -> (String){
        var string = ""
        for char in code.unicodeScalars{
            guard let uni = UnicodeScalar(127397 + char.value) else {return ""}
            string.unicodeScalars.append(uni)
        }
        return string
    }
    
    func loadCountries(){
        for countryCode in NSLocale.isoCountryCodes{
        let id = NSLocale.localeIdentifier(fromComponents: [NSLocale.Key.countryCode.rawValue:countryCode])
            guard let countryName = NSLocale(localeIdentifier: "en_UK").displayName(forKey: NSLocale.Key.identifier, value: id) else {return}
            let countryEmoji = emojiFromCode(code: countryCode)
            countryNames.append(Country(countryID: id, countryName: countryName, countryEmoji: countryEmoji, labelString: "\(countryEmoji) \(countryName)"))
        }
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countryNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = countryTableView.dequeueReusableCell(withIdentifier: "countryCell") as! CountryCellView
        cell.countryNameLabel.text = countryNames[indexPath.row].labelString
        return cell
    }
    
    
}
