//
//  ViewController.swift
//  CreativeWorkline iOS Test
//
//  Created by JOGENDRA on 16/02/18.
//  Copyright © 2018 Jogendra Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailButton: UIButton!
    @IBOutlet weak var websiteButton: UIButton!
    @IBOutlet weak var readMoreButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialUISetups()
    }
    
    fileprivate func initialUISetups() {
        emailButton.underline()
        websiteButton.underline()
        readMoreButton.underline()
    }

}

extension UIButton {
    
    func underline() {
        let attributedString = NSMutableAttributedString(string: (self.titleLabel?.text!)!)
        attributedString.addAttribute(NSAttributedStringKey.underlineStyle, value: NSUnderlineStyle.styleSingle.rawValue, range: NSRange(location: 0, length: (self.titleLabel?.text!.count)!))
        self.setAttributedTitle(attributedString, for: .normal)
    }
}

