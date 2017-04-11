//
//  ViewController.swift
//  NFFlatButtonSample
//
//  Copyright (c) 2014 norfred. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstButton: NFFlatButton!
    @IBOutlet weak var secondButton: NFFlatButton!
    @IBOutlet weak var thirdButton: NFFlatButton!
    @IBOutlet weak var fourthButton: NFFlatButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtons()
    }
    
    func setupButtons() {
        
        let colors = [ UIColor(red: 252.0/255.0, green: 171.0/255.0, blue: 44.0/255.0, alpha: 1.0), // Yellow
                       UIColor(red: 50.0/255.0, green: 50.0/255.0, blue: 50.0/255.0, alpha: 1.0),   // Black
                       UIColor(red: 171.0/255.0, green: 74.0/255.0, blue: 55.0/255.0, alpha: 1.0),  // Red
                       UIColor(red: 43.0/255.0, green: 76.0/255.0, blue: 118.0/255.0, alpha: 1.0)]  // Blue
        
        let buttons = [firstButton, secondButton, thirdButton, fourthButton]
        
        for (index, button) in buttons.enumerated() {
            button?.setTitle("Button", for: UIControlState())
            button?.setTitleColor(colors[index], for: UIControlState())
            button?.titleLabel?.font = UIFont(name: "HelveticaNeue-Medium", size: 16.0)
        }
    }
    
}

