//
//  ViewController.swift
//  calculator
//
//  Created by 배성빈 on 4/28/24.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func button_number(sender: UIButton) {
        if let digit = sender.currentTitle{
            print("\(digit)")
        }else{
            print("error")
        }
    }
}


