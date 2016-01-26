//
//  DetailViewController.swift
//  Bandung Wisata
//
//  Created by Steev Tupanwael on 1/25/16.
//  Copyright © 2016 Kota Bandung. All rights reserved.
//

import UIKit
import CoreLocation

class DetailViewController: UIViewController {

    @IBOutlet weak var ScrollView: UIScrollView!
    
    @IBOutlet weak var header_label: UINavigationItem!
    
    @IBOutlet weak var foto_label: UIImageView!
    
    @IBOutlet weak var judul_label: UILabel!
    
    @IBOutlet weak var deskripsi_label: UILabel!
    
    var lokasi = "-6.9032739,107.5729458"
    var alamat = ""

    @IBAction func peta_label(sender: AnyObject) {
        let geocoder = CLGeocoder()
        let address = alamat
        geocoder.geocodeAddressString(address) { (placemarksOpt, error) -> Void in
            if let placemarks = placemarksOpt {
                print("placemark| \(placemarks.first)")
                //var arrlok = self.lokasi.componentsSeparatedByString(",")
                if let location = placemarks.first?.location {
                    let query = "?ll=\(location.coordinate.latitude),\(location.coordinate.longitude))"
                    let path = "http://maps.apple.com/"+query
                    if let url = NSURL(string: path) {
                        UIApplication.sharedApplication().openURL(url)
                    } else {
                        //error
                        NSLog("Error1")
                    }
                } else {
                    //error
                    NSLog("Error2")
                }
            } else {
                //error
                NSLog("Error3")
                var arrlok = self.lokasi.componentsSeparatedByString(",")
                let query = "?ll=\(arrlok[0]),\(arrlok[1]))"
                let path = "http://maps.apple.com/"+query
                if let url = NSURL(string: path) {
                    UIApplication.sharedApplication().openURL(url)
                } else {
                    //error
                    NSLog("Error1")
                }
            }
        }
    }
    
    var detailItem: DetailData? {
        didSet {
            //update the view
            self.configureView();
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        
        if let detail = self.detailItem {
            header_label.title = detail.detjudul;
            header_label.backBarButtonItem?.title = nil;
            lokasi = detail.detlokasikoor
            alamat = detail.detalamat
            
            if let labelfoto = self.foto_label {
                labelfoto.image=UIImage(named: detail.detgambar);
            }
            if let labeljudul = self.judul_label {
                labeljudul.text = detail.detsubjudul
            }
            if let labeldeskripsi = self.deskripsi_label {
                labeldeskripsi.text = detail.detdeskripsi
            }
            
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

