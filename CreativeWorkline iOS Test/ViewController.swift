//
//  ViewController.swift
//  CreativeWorkline iOS Test
//
//  Created by JOGENDRA on 16/02/18.
//  Copyright © 2018 Jogendra Singh. All rights reserved.
//

import UIKit
import MessageUI

private struct Constants {
    static let scrollViewHeight: CGFloat = 1350
    static let stringToItalic: String = "tagging the world!"
    static let italicTextFontSize: CGFloat = 12.0
    static let swarduWebURLString: String = "https://www.swardu.com/"
    static let creativeWorklineWebURLString: String = "http://www.creativeworkline.com/?ref=si"
    static let termsURLString: String = "https://www.swardu.com/terms"
    static let privacyURLString: String = "https://www.swardu.com/privacy"
    static let supportMail: String = "support@swardu.com"
    static let supportMailSubject: String = "swardu iOS support request"
    static let sendMailErrorAlertTitle: String = "Could Not Send Email"
    static let sendMailErrorAlertMessage: String = "Your device could not send e-mail.  Please check e-mail configuration and try again."
    static let okActionTitle: String = "OK"
}

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
    
    private func setScrollViewContentSize() {
        scrollView.contentSize = CGSize(width: view.frame.width, height: Constants.scrollViewHeight)
    }
    
    private func initialUISetups() {
        
        emailButton.underline()
        websiteButton.underline()
        readMoreButton.underline()
        cwWebsiteButton.underline()
        
        makePartOfStringTextItallic()
    }
    
    private func makePartOfStringTextItallic() {
        
        let descriptionText: NSString = (descriptionTextView.text as NSString?)!
        let stringText = NSMutableAttributedString(string: descriptionTextView.text)
        stringText.addAttribute(NSAttributedStringKey.font, value: UIFont.italicSystemFont(ofSize: Constants.italicTextFontSize), range: descriptionText.range(of: Constants.stringToItalic))
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
        openURLInBrowser(Constants.swarduWebURLString)
    }
    
    @IBAction func didTapReadMore(_ sender: Any) {
    }
    
    @IBAction func didTapCwWebsite(_ sender: Any) {
        openURLInBrowser(Constants.creativeWorklineWebURLString)
    }
    
    @IBAction func didTapTermsOfUse(_ sender: Any) {
        openURLInBrowser(Constants.termsURLString)
    }
    
    @IBAction func didTapPrivacyPolicy(_ sender: Any) {
        openURLInBrowser(Constants.privacyURLString)
    }
    
    private func openURLInBrowser(_ urlString: String) {
        guard let url = URL(string: urlString) else {
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    // MARK: Mail
    private func configuredMailComposeViewController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        
        mailComposerVC.setToRecipients([Constants.supportMail])
        mailComposerVC.setSubject(Constants.supportMailSubject)
        
        return mailComposerVC
    }
    
    private func showSendMailErrorAlert() {
        let sendMailErrorAlertViewController = UIAlertController(title: Constants.sendMailErrorAlertTitle, message: Constants.sendMailErrorAlertMessage, preferredStyle: .alert)
        let okAction = UIAlertAction(title: Constants.okActionTitle, style: .default, handler: nil)
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

