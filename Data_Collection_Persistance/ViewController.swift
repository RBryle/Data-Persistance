//
//  ViewController.swift
//  Data_Collection_Persistance
//
//  Created by Ryan Bryle on 4/25/17.
//  Copyright © 2017 Ryan Bryle. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SaveLoad {
    
    var chemicalItems: [ChemicalItem]
    
    @IBOutlet weak var chemicalName: UITextField!
    @IBOutlet weak var companyName: UITextField!
    @IBOutlet weak var lotNumName: UITextField!
    
    required init?(coder aDecoder: NSCoder) {
        chemicalItems = []
        super.init(coder: aDecoder)
        loadChemicalListItems()
        print("Documents folder is \(documentsDir())")
        print("Data file path is \(dataFilePath())")
    }
    
    
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
        saveChemicalListItems()
        displayData()
        clearDataFields()
        reportChemicalArrayData()
    }
        
    func documentsDir() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func dataFilePath() -> URL {
        return documentsDir().appendingPathComponent("chemicalList.plist")
    }
    
    func saveChemicalListItems() {
        let data = NSMutableData()
        let archiver = NSKeyedArchiver(forWritingWith: data)
        archiver.encode(chemicalItems, forKey: "ChemicalItems")
        archiver.finishEncoding()
        data.write(to: dataFilePath(), atomically: true)
    }
    
    func loadChemicalListItems() {
        let path = dataFilePath()
        if let data = try? Data(contentsOf: path) {
            let unarchiver = NSKeyedUnarchiver(forReadingWith: data)
            chemicalItems = unarchiver.decodeObject(forKey: "ChemicalItems") as! [ChemicalItem]
            unarchiver.finishDecoding()
        }
    }
    
    func save(vc: DisplayChemicalsVC, saveObject: [ChemicalItem]) {
        chemicalItems = saveObject
        saveChemicalListItems()
    }
    
    
    func reportChemicalArrayData() {
        print("NUmber of elements in our chemical list: \(chemicalItems.count)")
    }
    
    @IBAction func viewAllButton(_ sender: Any) {
        if chemicalItems.count != 0 {
            performSegue(withIdentifier: "ViewAll", sender: nil)
        } else {
            let alertController = UIAlertController(title: "ERROR", message: "The chemical list is empty", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: { _ in
            print("The chemicalList array must NOT be empty to exe 'VIEW ALL'")
            })
            alertController.addAction(okAction)
            
            present(alertController, animated: true, completion: nil)
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ViewAll" {
            let displayVC = segue.destination as! DisplayChemicalsVC
            displayVC.chemicals = self.chemicalItems
            displayVC.delegate = self
        }
    }
    
    func displayData() {
        print("Chemical Name: \(chemicalItems[0].chemicalName)")
        print("Company Name: \(chemicalItems[0].companyName)")
        print("Lot#: \(chemicalItems[0].lotNumber)")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Current number of Chemical List Elements: \(chemicalItems.count)")
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

