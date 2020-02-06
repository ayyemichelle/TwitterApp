//
//  LoginViewController.swift
//  Twitter
//
//  Created by Michelle Vasquez-Aleman on 2/5/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // code run when page shows up
        // check the key in memory if the user already logged in
        if UserDefaults.standard.bool(forKey: "userLoggedIn") == true {
            // segue to home screen
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }
    }
    
    @IBAction func onLoginButton(_ sender: Any) {
        // this will run anytime login button is tapped
        let url = "https://api.twitter.com/oauth/request_token"
        TwitterAPICaller.client?.login(url: url, success: {
            // write note in memory that user already logged in
            UserDefaults.standard.set(true, forKey: "userLoggedIn")
            // segue from login to home screen
            self.performSegue(withIdentifier: "loginToHome", sender: self)
            
        }, failure: { (Error) in
            print("Could not login!")
        }) // closure
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
