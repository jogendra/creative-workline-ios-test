//
//  ViewController.swift
//  CreativeWorkline iOS Test
//
//  Created by JOGENDRA on 16/02/18.
//  Copyright © 2018 Jogendra Singh. All rights reserved.
//

import UIKit
import MessageUI

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
    
    @IBOutlet weak var contentView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        initialUISetups()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // Set the content size of Scroll View
        setScrollViewContentSize()
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(true)
//        let scrollViewSize = scrollView.frame.size
//        scrollView.contentSize = scrollViewSize
//    }
    
    private func setScrollViewContentSize() {
        scrollView.contentSize = CGSize(width: view.frame.width, height: 1350)
    }
    
    fileprivate func initialUISetups() {
        
        emailButton.underline()
        websiteButton.underline()
        readMoreButton.underline()
        cwWebsiteButton.underline()
        
        makePartOfStringTextItallic()
    }
    
    private func makePartOfStringTextItallic() {
        
        let descriptionText: NSString = (descriptionTextView.text as NSString?)!
        let stringText = NSMutableAttributedString(string: descriptionTextView.text)
        stringText.addAttribute(NSAttributedStringKey.font, value: UIFont.italicSystemFont(ofSize: 12.0), range: descriptionText.range(of: "tagging the world!"))
        descriptionTextView.attributedText = stringText
    }
    
    
    
    // MARK: Actions
    
    @IBAction func didTapSupportEmail(_ sender: Any) {
        let mailComposeViewController = configuredMailComposeViewController()
        if MFMailComposeViewController.canSendMail() {
            self.present(mailComposeViewController, animated: true, completion: nil)
        } else {
            self.showSendMailErrorAlert()
        }
    }
    
    @IBAction func didTapSwarduWebsite(_ sender: Any) {
        openURLInBrowser("https://www.swardu.com/")
    }
    
    @IBAction func didTapReadMore(_ sender: Any) {
    }
    
    @IBAction func didTapCwWebsite(_ sender: Any) {
        openURLInBrowser("http://www.creativeworkline.com/?ref=si")
    }
    
    @IBAction func didTapTermsOfUse(_ sender: Any) {
        openURLInBrowser("https://www.swardu.com/terms")
    }
    
    @IBAction func didTapPrivacyPolicy(_ sender: Any) {
        openURLInBrowser("https://www.swardu.com/privacy")
    }
    
    private func openURLInBrowser(_ urlString: String) {
        guard let url = URL(string: urlString) else {
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    // MARK: Mail
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self // Extremely important to set the --mailComposeDelegate-- property, NOT the --delegate-- property
        
        mailComposerVC.setToRecipients(["support@swardu.com"])
        mailComposerVC.setSubject("swardu iOS support request")
        
        return mailComposerVC
    }
    
    func showSendMailErrorAlert() {
        let sendMailErrorAlertViewController = UIAlertController(title: "Could Not Send Email", message: "Your device could not send e-mail.  Please check e-mail configuration and try again.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        sendMailErrorAlertViewController.addAction(okAction)
        self.present(sendMailErrorAlertViewController, animated: true, completion: nil)
    }
}

// MARK: MFMailComposeViewControllerDelegate Method

extension ViewController: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
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

