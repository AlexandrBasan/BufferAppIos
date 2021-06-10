//
//  ViewController.swift
//  Buffer
//
//  Created by Alexandr Basan on 25/05/21.
//

import UIKit

class ViewController: UIViewController {
    
    let DATA_KEY = "data"
    
    @IBOutlet weak var textView: UITextView!
    
    var pastedStrings: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let loadedStrings = UserDefaults.standard.stringArray(forKey: DATA_KEY) {
            pastedStrings.append(contentsOf: pastedStrings)
        }
        // Do any additional setup after loading the view.
        showText()
    }
    
    func addText() {
        guard let text = UIPasteboard.general.string, !pastedStrings.contains(text) else {return}
        pastedStrings.append(text)
        UserDefaults.standard.set(pastedStrings, forKey: DATA_KEY)
        showText()
    }
    
    func showText() {
        //textView.text = UIPasteboard.general.string
        textView.text = ""
        for str in pastedStrings {
            textView.text.append("\(str)\n--------------------\n")
        }
    }

    @IBAction func trashWasPressed(_ sender: Any) {
        pastedStrings.removeAll()
        textView.text = ""
        UserDefaults.standard.removeObject(forKey: DATA_KEY)
    }
    
    @IBAction func refreshWasPressed(_ sender: Any) {
        addText()
    }
}

