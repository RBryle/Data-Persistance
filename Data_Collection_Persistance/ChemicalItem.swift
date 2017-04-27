//
//  ChemicalItem.swift
//  Data_Collection_Persistance
//
//  Created by Ryan Bryle on 4/25/17.
//  Copyright © 2017 Ryan Bryle. All rights reserved.
//

import UIKit

class ChemicalItem: NSObject, NSCoding {
    
    var chemicalName: String = ""
    var companyName: String = ""
    var lotNumber: String = ""
    
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        chemicalName = aDecoder.decodeObject(forKey: "ChemicalName") as! String
        companyName = aDecoder.decodeObject(forKey: "CompanyName") as! String
        lotNumber = aDecoder.decodeObject(forKey: "LotNumber") as! String
        super.init()
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(chemicalName, forKey: "ChemicalName")
        aCoder.encode(companyName, forKey: "CompanyName")
        aCoder.encode(lotNumber, forKey: "LotNumber")
    }

    
}
