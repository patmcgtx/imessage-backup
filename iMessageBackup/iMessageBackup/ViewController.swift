//
//  ViewController.swift
//  iMessageBackup
//
//  Created by Patrick McGonigle on 4/28/22.
//

import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet weak var statusLabel: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func updateStatus(_ status: String) {
        self.statusLabel.stringValue = status
    }
    
    override func viewDidAppear() {
        
        // TODO Trigger this with a button
        
        if let dbURL = ChatDbFinder().promptForChatDb() {
            let chatReader = ChatReader(dbPath: dbURL.path)
            switch chatReader?.numMessages {
            case .success(let count):
                self.updateStatus("Found \(count) messages.")
            case .failure(let error):
                self.updateStatus(error.localizedDescription)
            case .none:
                self.updateStatus("Can't read database.")
            }
        }
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

}

