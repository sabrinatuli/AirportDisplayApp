//
//  ViewController.swift
//  AirportApp
//
//  Created by Sabrina Tuli on 30/6/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var tableView: UITableView!
    
    var mng = AirportManager()
    var airport = [Airport]()
    var filtereddatacsv : [[String]] = []
    var timezonearr = [GroupedAirPort]()
    var isFiltering = false
    var isTimezonesorted = false
    override func viewDidLoad() {
        
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self,
                               forCellReuseIdentifier: "TableViewCell")
        print(isTimezonesorted)
        
        //get data from csv
        
        self.airport = mng.getAirportDatafromCSV(filename: "airport")
        
        
        

                
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if isTimezonesorted {
            //print("Section row",timezonearr[section].data.count)
            return self.timezonearr[section].data.count
        }
        else
        {
            return self.airport.count
        }
       
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // create a new cell if needed or reuse an old one
        //let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell",for: indexPath)
        let cell = UITableViewCell(style: .subtitle , reuseIdentifier: "subtitleCell")
        // set the text from the data model
        
        if isTimezonesorted {
            //print(indexPath.section)
            //print(indexPath.row)
            cell.textLabel?.text = self.timezonearr[indexPath.section].data[indexPath.row].airportName
            cell.detailTextLabel?.text = self.timezonearr[indexPath.section].data[indexPath.row].timezone
            
        }
        else{
            cell.textLabel?.text = self.airport[indexPath.row].airportName  //airTzone[indexPath.row]["AirportName"]
            cell.detailTextLabel?.text = self.airport[indexPath.row].timezone                                   //airTzone[indexPath.row]["Timezone"]
        }
        
        
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        if isTimezonesorted {
            vc.nameText = self.timezonearr[indexPath.section].data[indexPath.row].airportName+" ("+self.timezonearr[indexPath.section].data[indexPath.row].airportCode+")"
            vc.cityText = self.timezonearr[indexPath.section].data[indexPath.row].city
            vc.stateText = self.timezonearr[indexPath.section].data[indexPath.row].state
            vc.timezoneText = self.timezonearr[indexPath.section].data[indexPath.row].timezone
            
            
        }
        else{
            vc.nameText = self.airport[indexPath.row].airportName+" ("+self.airport[indexPath.row].airportCode+")"
            vc.cityText = self.airport[indexPath.row].city
            vc.stateText = self.airport[indexPath.row].state
            vc.timezoneText = self.airport[indexPath.row].timezone
        }
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
       if isTimezonesorted
        {
        //print("Count",timezonearr.count)
            return timezonearr.count
        }
        else
        {
        return 1
        }
 
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if isTimezonesorted
         {
            return timezonearr[section].sortedzone
         }
         else
         {
         return " "
         }
 
    }

    
    @IBAction func SortName(_ sender: Any) {
        
        self.airport = mng.SortedAirportName(airName: self.airport)
        isTimezonesorted = false
        self.tableView.reloadData()
        
    }
    
    
    @IBAction func SortTZone(_ sender: Any) {
        
        self.timezonearr = mng.SortedAirportTimezone(airTzone: self.airport)
        isTimezonesorted = true
        self.tableView.reloadData()
    }
}

