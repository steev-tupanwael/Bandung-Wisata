//
//  DetailData.swift
//  Bandung Wisata
//
//  Created by Steev Tupanwael on 1/26/16.
//  Copyright © 2016 Kota Bandung. All rights reserved.
//

import Foundation

class DetailData {
    var detjudul : String
    var detsubjudul : String
    var detalamat : String
    var detkontak : String
    var detdeskripsi : String
    var detgambar : String
    var detlokasikoor : String
    
    init(detjudul:String, detsubjudul:String, detalamat:String, detkontak:String, detdeskripsi:String, detgambar:String, detlokasikoor:String) {
        self.detjudul = detjudul
        self.detsubjudul = detsubjudul
        self.detalamat = detalamat
        self.detkontak = detkontak
        self.detdeskripsi = detdeskripsi
        self.detgambar = detgambar
        self.detlokasikoor = detlokasikoor
    }
}