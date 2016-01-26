//
//  MasterViewController.swift
//  Bandung Wisata
//
//  Created by Steev Tupanwael on 1/25/16.
//  Copyright © 2016 Kota Bandung. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    var detailArray = [DetailData]()
    var numberofRows = 0
    var dataIdArray = [String]()
    var dataJudulArray = [String]()
    var dataSubjudulArray = [String]()
    var dataAlamatArray = [String]()
    var dataKontakArray = [String]()
    var dataDeskripsiArray = [String]()
    var dataGambarArray = [String]()
    var dataLokasikoorArray = [String]()
    
    func parseJSON() {
        let path :  String = NSBundle.mainBundle().pathForResource("jsonFile", ofType: "json") as String!
        let jsonData = NSData(contentsOfFile: path) as NSData!
        let readableJSON = JSON(data: jsonData, options: NSJSONReadingOptions.MutableContainers, error:  nil)
        
        numberofRows = readableJSON["data"].count - 1
        
        for i in 0...numberofRows {
            let judul = readableJSON["data"][i]["judul"].string as String!
            let subjudul = readableJSON["data"][i]["subjudul"].string as String!
            let alamat = readableJSON["data"][i]["alamat"].string as String!
            let kontak = readableJSON["data"][i]["kontak"].string as String!
            let deskripsi = readableJSON["data"][i]["deskripsi"].string as String!
            let gambar = readableJSON["data"][i]["gambar"].string as String!
            let lokasikoor = readableJSON["data"][i]["lokasikoor"].string as String!
            
            dataJudulArray.append(judul)
            dataSubjudulArray.append(subjudul)
            
            let dataObj = DetailData(detjudul: judul, detsubjudul: subjudul, detalamat: alamat, detkontak: kontak, detdeskripsi: deskripsi, detgambar: gambar, detlokasikoor: lokasikoor)
            detailArray.append(dataObj)
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
        
        parseJSON()
    }

    override func viewWillAppear(animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.collapsed
        super.viewWillAppear(animated)
        navigationItem.title = "Bandung Wisata"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let data = detailArray[indexPath.row]
                let controller = (segue.destinationViewController as! UINavigationController).topViewController as! DetailViewController
                controller.detailItem = data
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
        navigationItem.title = ""
    }

    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberofRows
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        if dataJudulArray.count != 0 {
            cell.textLabel!.text = dataJudulArray[indexPath.row]
        }
        if dataSubjudulArray.count != 0 {
            cell.detailTextLabel!.text = dataSubjudulArray[indexPath.row]
        }
        
        return cell
    }


}

