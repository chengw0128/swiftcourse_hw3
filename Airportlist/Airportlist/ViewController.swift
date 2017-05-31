//
//  ViewController.swift
//  Airportlist
//
//  Created by mac on 2017/5/30.
//  Copyright © 2017年 mac. All rights reserved.
//

import UIKit

let path = Bundle.main.path(forResource: "airports", ofType: "plist")
var airports:[[String:String]] = NSArray(contentsOfFile: path!)! as! Array

class AirportListViewController: UITableViewController{
    
    var countryname:[String] = []
    var groupairport:[[[String:String]]] = [[[:]]]
    var country:Set<String> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for airport in airports{
            country.insert(airport["Country"]!)
        }
        for _ in 1...country.count{
            var group:[[String:String]] = [[:]]
            countryname.append(country.first!)
            for airport in airports{
                if(airport["Country"]==country.first){
                    group.append(airport)
                }
            }
            group.removeFirst()
            country.removeFirst()
            groupairport.append(group)
        }
        groupairport.removeFirst()
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return countryname.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return countryname[section]
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupairport[section].count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Airportscell") as UITableViewCell!
        cell?.textLabel?.text = groupairport[indexPath.section][indexPath.row]["ShortName"]
        cell?.detailTextLabel?.text = groupairport[indexPath.section][indexPath.row]["IATA"]
        return cell!
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let AirportViewController = segue.destination as! AirportViewController
        let senderIndexPath = self.tableView.indexPath(for: sender as! UITableViewCell)!
        AirportViewController.airport = groupairport[senderIndexPath.section][senderIndexPath.row]
    }
}

