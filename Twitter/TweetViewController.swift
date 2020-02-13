//
//  TweetViewController.swift
//  Twitter
//
//  Created by Michelle Vasquez-Aleman on 2/8/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class TweetViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var tweetTextView: UITextView!
    @IBOutlet weak var charCountLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tweetTextView.becomeFirstResponder() // display keyboard
        // Do any additional setup after loading the view.
        tweetTextView.delegate = self
    }
    
    @IBAction func cancelTweet(_ sender: Any) {
        // dismiss controller
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tweet(_ sender: Any) {
        if(!tweetTextView.text.isEmpty){
            TwitterAPICaller.client?.postTweet(tweetString: tweetTextView.text, success: {
                self.dismiss(animated: true, completion: nil)
            }, failure: { (Error) in
                print("Error posting tweet \(Error)")
                self.dismiss(animated: true, completion: nil)
            })
        }else{
            dismiss(animated: true, completion: nil)
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
       // TODO: Check the proposed new text character count
        let characterLimit = 140
       // Allow or disallow the new text
        let newText = NSString(string: textView.text!).replacingCharacters(in: range, with: text)
        // update label
        let charRemainaing = characterLimit - newText.count
        if (charRemainaing <= 20) {
            charCountLabel.textColor = UIColor.red
        }else{
            charCountLabel.textColor = UIColor.systemGray
        }
        charCountLabel.text = "\(charRemainaing)/140"
        return newText.count < characterLimit
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
