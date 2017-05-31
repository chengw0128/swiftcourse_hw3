//
//  AirportViewController.swift
//  Airportlist
//
//  Created by mac on 2017/5/31.
//  Copyright © 2017年 mac. All rights reserved.
//
import UIKit

class AirportViewController: UIViewController {
    
    var airport = [String:String]()
    var titleLabel: UILabel! {
        return self.navigationItem.titleView as! UILabel
    }
    @IBOutlet weak var AirportName: UILabel!
    @IBOutlet weak var AirportCountry: UILabel!
    @IBOutlet weak var AirportCity: UILabel!
    @IBOutlet weak var AirportImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AirportName.lineBreakMode = NSLineBreakMode.byWordWrapping
        AirportName.numberOfLines = 0
        self.updateUIElements()
    }
    
    func updateUIElements() {
        let imgname = airport["IATA"]
        self.titleLabel.text = airport["IATA"]
        self.AirportName.text = airport["Airport"]
        self.AirportCountry.text = airport["Country"]
        self.AirportCity.text = airport["ServedCity"]
        self.AirportImage.image = UIImage(named: imgname!)
    }
}
