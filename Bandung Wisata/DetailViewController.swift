//
//  DetailViewController.swift
//  Bandung Wisata
//
//  Created by Steev Tupanwael on 1/25/16.
//  Copyright © 2016 Kota Bandung. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var ScrollView: UIScrollView!
    
    @IBOutlet weak var judul_label: UILabel!
    
    @IBOutlet weak var deskripsi_label: UILabel!

    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = self.detailItem {
            if let labeljudul = self.judul_label {
                labeljudul.text = detail.description
                labeljudul.numberOfLines = 0
            }
        }
        if let labeldesk = self.deskripsi_label {
            labeldesk.text = "Lorem ipsum dolor sit amet, mei at brute delicata vituperatoribus, in eum sint dolores. Nam et nisl saperet suscipiantur. Ex consulatu definitionem pro, cu nec nusquam recusabo, ad putent vidisse alterum nam. Per te wisi audire, ea cum ornatus eleifend. Mea eu vero porro argumentum. Ius cu postea blandit, in has lorem moderatius, cum at unum convenire.\n\nVis graeci nusquam no, verterem euripidis evertitur quo ne, ne vim dolorem epicurei efficiantur. Id eripuit voluptua mel. Propriae incorrupte voluptatibus no sea, at pro congue electram appellantur, vel et facer interesset. Eum veri assentior honestatis an. Perfecto argumentum est ne.\n\nHas movet zril an, natum tacimates ius id. Ad cibo summo splendide mea. Graece apeirian his ut, ne nam case essent habemus. Doctus veritus ea ius. Mea choro recusabo definiebas et, ei eam posse quodsi verterem. An quo ludus offendit expetendis, ad mazim numquam his, no quem repudiare pertinacia pri.\n\nMei ut veritus elaboraret, id vim duis augue disputando. Duo id quis eruditi denique. At vidit errem commodo vel. Ne maiorum probatus conceptam sea, case maluisset mei ea. Vim suas homero apeirian in, zril detracto mea at, cu sint ancillae quo.\n\nFastidii evertitur ex his, eos ea dolorum abhorreant reprehendunt, duis suavitate constituam id sit. Sonet referrentur mel ex, ex mea posse semper, no duo veri mollis vocent. Has sonet percipit id, vide dissentias an usu. Eam dolore impetus ponderum te, sea ut stet delectus. Invenire recteque nec ea, stet libris facilisi te sed, est alia persequeris id.\n\nPopulo discere at ius, dicit iudico probatus ex nam, cu quem posidonium vel. Ei prima antiopam facilisis sit. Quando dictas ocurreret in cum. Veri adhuc cu vim. Eam ex etiam probatus. Mel at facer consul, cu per iusto regione probatus, pro at scaevola quaerendum.\n\nVocent copiosae quaestio ei cum, an cum delectus forensibus. Mei solet dissentiunt no, nec ne esse praesent mnesarchum. Soluta democritum ne sit. Eos id dicat dolorem, sit at sapientem dissentiet, ullum tollit quaeque an sit. Mei an soleat singulis pericula.\n\nPro cu possim partiendo, vix ut lorem civibus, ex mutat eripuit mei. Eam at omnis menandri explicari, et laoreet laboramus cum. Est nemore facilisi electram et. Te eos putent adipiscing, elit volumus incorrupte eum te. An nam nisl choro tacimates, eum illud labitur ponderum id.\n\nSea aliquip suavitate ei. An errem choro his, alia expetenda id pri. Usu at iriure meliore, eruditi accusata at eum, ei errem laboramus vituperatoribus est. Falli conceptam intellegebat at ius, per id eros simul. Cu duo meliore senserit deterruisset.\n\nEx cetero aliquando est, eam ut fugit ceteros. Cum at iriure volutpat. Vis cu unum justo delicatissimi, dolor quidam denique eam eu. In eum malis exerci pericula, qui ad dico intellegebat."
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //ScrollView.contentSize.height = 1000
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

