//
//  AddEntryViewController.swift
//  MyJournalApp
//
//  Created by Aleksandra Rusak on 2023-09-07.
//

import UIKit

class AddEntryViewController: UIViewController {

    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var switchDate: UISwitch!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var txtNotes: UITextView!
    
    var myJournal: Journal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func onSwitchDate(_ sender: Any) {
        if switchDate.isOn {
            //då visar upp datePicker
            datePicker.isHidden = false
        } else {
            //då hide vi datePicker
            datePicker.isHidden = true
        }
    }
    
    
    @IBAction func onSave(_ sender: UIBarButtonItem) {
        
        guard let title = txtTitle.text,
              let notes = txtNotes.text
         else {
            return
        }
        
        let newEntry = JournalEntry(title: title, date: switchDate.isOn ? datePicker.date : Date(), notes: notes)
        
        if switchDate.isOn {
            // skapa en JourneyEntry med vårat egna datum
            
            let newEntry = JournalEntry(title: title, date: datePicker.date, notes: notes)
            myJournal?.addEntry(newEntry: newEntry)
            
            // stänger av sidan
            self.navigationController?.popViewController(animated: true)
            
        } else {
            // skapa en JourneyEntry med dagens datum
            
            let newEntry = JournalEntry(title: title, date: Date(), notes: notes)
            myJournal?.addEntry(newEntry: newEntry)
            
            // stänger av sidan
            self.navigationController?.popViewController(animated: true)
            
            
            
        }
    }
    
}
