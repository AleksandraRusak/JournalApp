//
//  Journal.swift
//  MyJournalApp
//
//  Created by Aleksandra Rusak on 2023-09-07.
//

import Foundation

class Journal {
    
    // en lista
    private var entries: [JournalEntry]
    
    init() {
        self.entries = [JournalEntry(title: "Exempel", date: Date(), notes: "Hej")]
    }
    
    func getEntriesCount() -> Int {
        return entries.count
    }
    
    // get 1 entry med spesiellt index
    func getEntry(atIndex index: Int) -> JournalEntry {
        return entries[index]
    }
    
    func addEntry(newEntry: JournalEntry) {
        entries.append(newEntry)
    }
    
}
