//
//  ViewController.swift
//  CreativeWorkline iOS Test
//
//  Created by JOGENDRA on 16/02/18.
//  Copyright © 2018 Jogendra Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Outlets
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var emailButton: UIButton!
    @IBOutlet weak var websiteButton: UIButton!
    @IBOutlet weak var readMoreButton: UIButton!
    @IBOutlet weak var cwWebsiteButton: UIButton!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var termsOfUseButton: UIButton!
    @IBOutlet weak var privacyPolicyButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialUISetups()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // Set the content size of Scroll View
        scrollView.contentSize = CGSize(width: view.frame.width, height: 1250)
    }
    
    fileprivate func initialUISetups() {
        
        emailButton.underline()
        websiteButton.underline()
        readMoreButton.underline()
        cwWebsiteButton.underline()
    }
    
    // MARK: Actions
    
    @IBAction func didTapSupportEmail(_ sender: Any) {
    }
    
    @IBAction func didTapSwarduWebsite(_ sender: Any) {
    }
    
    @IBAction func didTapReadMore(_ sender: Any) {
    }
    
    @IBAction func didTapCwWebsite(_ sender: Any) {
    }
    
    @IBAction func didTapTermsOfUse(_ sender: Any) {
    }
    
    @IBAction func didTapPrivacyPolicy(_ sender: Any) {
    }
}

// MARK: Extension for underlining titles of UIButtons

extension UIButton {
    
    func underline() {
        let attributedString = NSMutableAttributedString(string: (self.titleLabel?.text!)!)
        attributedString.addAttribute(NSAttributedStringKey.underlineStyle, value: NSUnderlineStyle.styleSingle.rawValue, range: NSRange(location: 0, length: (self.titleLabel?.text!.count)!))
        self.setAttributedTitle(attributedString, for: .normal)
    }
}

