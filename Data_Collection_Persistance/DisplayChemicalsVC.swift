//
//  DisplayChemicalsVC.swift
//  Data_Collection_Persistance
//
//  Created by Ryan Bryle on 4/25/17.
//  Copyright © 2017 Ryan Bryle. All rights reserved.
//

import UIKit
class DisplayChemicalsVC: UITableViewController {
    
    var chemicals: [ChemicalItem]!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chemicals!.count + 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChemicalCell", for: indexPath)
        
        let chemicalLabel = cell.viewWithTag(100) as! UILabel
        let companyLabel = cell.viewWithTag(101) as! UILabel
        let lotNum = cell.viewWithTag(102) as! UILabel
        
        if indexPath.row != chemicals.count {
        chemicalLabel.text = configureText(chemicalItem: chemicals[indexPath.row]).0
        companyLabel.text = configureText(chemicalItem: chemicals[indexPath.row]).1
        lotNum.text = configureText(chemicalItem: chemicals[indexPath.row]).2
        } else {
            companyLabel.text = "EXIT"
            chemicalLabel.text = ""
            lotNum.text = ""
        }
        return cell
    }
    
    func configureText(chemicalItem: ChemicalItem) -> (String, String, String) {
        let chemical = chemicalItem.chemicalName
        let company = chemicalItem.companyName
        let lotNum = chemicalItem.lotNumber
        return (chemical, company, lotNum)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == chemicals.count {
            dismiss(animated: true, completion: nil)
        }
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            chemicals.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
 

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
