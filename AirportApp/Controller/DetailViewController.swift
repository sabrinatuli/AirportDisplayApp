//
//  DetailViewController.swift
//  AirportApp
//
//  Created by Sabrina Tuli on 30/6/21.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var statefield: UILabel!
    
    @IBOutlet weak var timezonefield: UILabel!
    @IBOutlet weak var cityfield: UILabel!
    @IBOutlet weak var namefield: UILabel!
    var nameText: String = " "
    var cityText: String = " "
    var stateText: String = " "
    var timezoneText: String = " "

    override func viewDidLoad() {
        super.viewDidLoad()
        namefield.text = nameText
        cityfield.text = cityText
        statefield.text = stateText
        timezonefield.text = timezoneText

    }


   

}
