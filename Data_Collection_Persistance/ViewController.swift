//
//  ViewController.swift
//  Data_Collection_Persistance
//
//  Created by Ryan Bryle on 4/25/17.
//  Copyright © 2017 Ryan Bryle. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var chemicalItems: [ChemicalItem] = []
    
    @IBOutlet weak var chemicalName: UITextField!
    @IBOutlet weak var companyName: UITextField!
    @IBOutlet weak var lotNumName: UITextField!
    
    
    @IBAction func ridKeyboard(_ sender: Any) {
        chemicalName.resignFirstResponder()
        companyName.resignFirstResponder()
        lotNumName.resignFirstResponder()
    }
    
    @IBAction func enterButton(_ sender: Any) {
        let chemItem = ChemicalItem()
        chemItem.chemicalName = chemicalName.text!
        chemItem.companyName = companyName.text!
        chemItem.lotNumber = lotNumName.text!
        chemicalItems.append(chemItem)
        displayData()
        clearDataFields()
        reportChemicalArrayData()
    }
    
    func reportChemicalArrayData() {
        print("NUmber of elements in our chemical list: \(chemicalItems.count)")
    }
    
    
    @IBAction func viewAllButton(_ sender: Any) {
        performSegue(withIdentifier: "ViewAll", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ViewAll" {
            let displayVC = segue.destination as! DisplayChemicalsVC
            displayVC.chemicals = self.chemicalItems
        }
    }
    
    func displayData() {
        print("Chemical Name: \(chemicalItems[0].chemicalName)")
        print("Company Name: \(chemicalItems[0].companyName)")
        print("Lot#: \(chemicalItems[0].lotNumber)")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func clearDataFields() {
        chemicalName.text = ""
        companyName.text = ""
        lotNumName.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


}

