//
//  TableViewController.swift
//  MyJournalApp
//
//  Created by Aleksandra Rusak on 2023-09-07.
//

import UIKit

class TableViewController: UITableViewController {
    
    let JOURNAL_IDENTIFIER = "JournalCell"
    
    let SEGUE_TO_ADD = "segueToAdd"
    
    let SEGUE_TO_VIEW_ENTRY = "segueEntryView"

    let myJournal = Journal()
    
    @IBOutlet var myTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func viewWillAppear(_ animated: Bool) {
        myTableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    // visar hur många rader det blir
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return myJournal.getEntriesCount()
    }


    // visar vad inehåller varje cell - note
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: JOURNAL_IDENTIFIER, for: indexPath)

        // Configure the cell

        var content = cell.defaultContentConfiguration()
        
        /*  blir 5 toma rader till
         if indexPath.row < students.count {
            content.text = students[indexPath.row]
        }
         */
        
        let entry = myJournal.getEntry(atIndex:indexPath.row)
        
        content.text = "\(entry.date) \(entry.title)"
        
        cell.contentConfiguration = content

        return cell
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == SEGUE_TO_ADD {
            if let destinationVC = segue.destination as? AddEntryViewController {
                destinationVC.myJournal = self.myJournal
            }
            return
        }
        
        if segue.identifier == SEGUE_TO_VIEW_ENTRY {
           /*
            if let destinationVC = segue.destination as? EntryViewController {
                
    // om sender faktiskt är en UITableViewCell, så skapar vi variabeln cell och kör kodblocket nedan.
                if let cell = sender as? UITableViewCell {
   
                    if let indexPath = myTableView.indexPath(for: cell) {
                        
                        let entry = myJournal.getEntry(atIndex: indexPath.row)
                        
                        destinationVC.entry = entry
                    }
                }
            }
            */
            
            guard let destinationVC = segue.destination as? EntryViewController else {return}
            guard let cell = sender as? UITableViewCell else {return}
            guard let indexPath = myTableView.indexPath(for: cell) else {return}
            let entry = myJournal.getEntry(atIndex: indexPath.row)
    
            destinationVC.entry = entry
        }
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
    

}
