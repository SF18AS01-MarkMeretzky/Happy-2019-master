//
//  ViewController.swift
//  Happy 2019
//
//  Created by Esteban Ordonez on 1/1/19.
//  Copyright © 2019 Esteban Ordonez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var lightOn : Bool = true;

    @IBOutlet weak var beforeCount: UILabel!
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var askDate: UITextField!
    @IBOutlet weak var afterCount: UILabel!
    @IBOutlet weak var reallyAfterCount: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        askDate.isHidden = true;
        date.isHidden = true;
        beforeCount.isHidden = true;
    }
    
    @IBAction func senDate(_ sender: UITextField) {
        if sender.text!.count != 8 {
            view.backgroundColor = .red;
            beforeCount.text = "Need 8 digits, mmddyyyy!";
            return; //refuse to accept badly lengthed input.
        }
        
        //Arrive here when user typed valid input and presses return.
        view.backgroundColor = .black;
        beforeCount.text = "Thank you.";
        
        sender.resignFirstResponder();
        //let d: Int = Int(sender.text!)!;
        //let daysRemain: Int = 12312019 - d;
        let all8chars: String = sender.text!;
        
        let first2chars: String = String(all8chars.prefix(2));
        let remaining6chars: String = String(all8chars.dropFirst(2));
        let month: Int = Int(first2chars)!;
        
        let next2chars: String = String(remaining6chars.prefix(2));
        let remaining4chars: String = String(remaining6chars.dropFirst(2));
        let day: Int = Int(next2chars)!;
        
        let year: Int = Int(remaining4chars)!;
        print(month, day, year);
        
        let calendar: Calendar = Calendar.current;   //our Gregorian calendar
        var today: Date = calendar.date(from: DateComponents(year: year, month: month, day: day))!;
        var newYearsEve: Date = calendar.date(from: DateComponents(year: year, month: 12, day: 31))!;
        
        let dateInterval: DateInterval = DateInterval(start: today, end: newYearsEve);
        let seconds: Int = Int(dateInterval.duration);
        reallyAfterCount.text = "There are \(String(seconds / (60 * 60 * 24))) to 2019";
    }
    
    @IBAction func swipe(_ sender: UISwipeGestureRecognizer) {
        
        lightOn = !lightOn;
        updateUI();
        
        switch sender.direction.rawValue {
        case 1:
            mainLabel.text = "Welcome to 2019!";
            
        case 2:
            mainLabel.text = "Live long and prosper!";
            
        case 4:
            mainLabel.text = "There are "
            
        case 8:
            mainLabel.text = " Seize The Day ";
            
        default:
            mainLabel.text = " unreacognized direction ";
        }
        
        askDate.isHidden = false;
        date.isHidden = false;
        beforeCount.isHidden = false;
    }
    
    /**
     @IBAction func swipeUp(_ sender: UISwipeGestureRecognizer) {
     print("swipeUp");
     lightOn = !lightOn;
     mainLabel.text = "Live long and prosper!";
     updateUI();
     **/
  
    
    func updateUI(){
        view.backgroundColor = lightOn ? .white : .black;
        
    }
    

}

