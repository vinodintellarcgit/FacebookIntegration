//
//  ViewController.swift
//  IntSocialFLogin
//
//  Created by Vinod Tiwari on 21/05/19.
//  Copyright © 2019 Intellarc. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit


class ViewController: UIViewController {

    var user = User()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
  
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @IBAction func login(_ sender: Any)
    {
        let manager = FacebookAPIManager()
        manager.loginWithFacebook(fromController: self) { [weak self](user, error) in
            if let user = user{
                self?.user = user
                let vc = self?.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
                vc.setUser(user: user)
                self?.navigationController?.pushViewController(vc, animated: true)
            }else{
                print(error.debugDescription)
            }
        }
    }
    
    
}
