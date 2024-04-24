//
//  ViewController.swift
//  counter
//
//  Created by big stepper on 4/24/24.
//

import UIKit

class ViewController: UIViewController {
    
    let date : String = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ru_RU")
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        let stringDate = formatter.string(from: Date())
        return stringDate
    }()
    
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var historyTextView: UITextView!
    
    private var counter: Int = 0
    
    private var changesHistoryList: [String] = []
    
    @IBAction func resetButton(_ sender: Any) {
        counter = 0
        counterLabel.text = String(counter)
        changesHistoryList.append("counter was reset \n\(date)")
        updateChangesHistory()
    }
    
    @IBAction func counterDecrement(_ sender: Any) {
        if counter > 0 {
            counter -= 1
            counterLabel.text = String(counter)
            changesHistoryList.append("value decremented by -1 \n\(date)")
        } else {
            changesHistoryList.append("attempted to decrement counter below zero \n\(date)")
        }
        updateChangesHistory()
    }
    
    @IBAction func counterIncrement(_ sender: Any) {
        counter += 1
        counterLabel.text = String(counter)
        changesHistoryList.append("value incremented by +1 \n\(date)")
        updateChangesHistory()
    }
    
    private func updateChangesHistory() {
        var text: String = ""
        
        for index in 0..<changesHistoryList.count {
            text += "\n\(changesHistoryList[index])\n"
        }
        
        historyTextView.text = text
        
        let range = NSMakeRange(historyTextView.text.count - 1, 0)
        historyTextView.scrollRangeToVisible(range)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        historyTextView.isScrollEnabled = true
        historyTextView.isEditable = false
    }
        
}

