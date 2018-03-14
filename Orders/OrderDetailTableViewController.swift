//
//  OrderDetailTableViewController.swift
//  ChefEV
//
//  Created by Nick Richardson on 10/3/17.
//  Copyright © 2017 Nick Richardson. All rights reserved.
//

import UIKit

class OrderDetailTableViewController: UITableViewController {
    
   
    var sentData1:String!
    var sentData2:[String]!
    
    
    var proteinSauce = ["Fair Food BBQ", "Carolina BBQ","Bourbon",
        "Sweet Southern BBQ","Roasted Pineapple Habanero","Italian","Caribbean Jerk", "Horsey Garlic","Roasted Sweet Pepper","Sriracha Lime","Chipotle","Spicy Chipotle","Jalapeno Peach BBQ","Sweet Smokey Fire","Dark Chocolate Mocha","Spicy Peanut Butter","Hawaiian","Cajun","Mesquite", "Buffalo","Seafood Bay","Western BBQ","Sriracha"]
    

    
  
    override func viewDidLoad() {
        super.viewDidLoad()

        
        //let background = UIImage(named: "background.jpg")
        //self.tableView.backgroundView = UIImageView(image: background)
        
        
        print("this is in the OrderDetailTableViewController:" , sentData1)
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return proteinSauce.count
    }
    
    
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let proteinSauceCell = tableView.dequeueReusableCell(withIdentifier: "proteinSauceCell", for: indexPath) as! proteinSauceTableViewCell
        
        proteinSauceCell.proteinSauceTitle.text = proteinSauce[indexPath.row]
        
      
    
     return proteinSauceCell
     }
     
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
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
