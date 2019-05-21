//
//  HomeViewController.swift
//  IntSocialFLogin
//
//  Created by Vinod Tiwari on 21/05/19.
//  Copyright © 2019 Intellarc. All rights reserved.
//

import UIKit

import FBSDKLoginKit
class HomeViewController: UIViewController {

    @IBOutlet weak var nameLable:UILabel!
    @IBOutlet weak var emailLable:UILabel!
    @IBOutlet weak var imageProfile:UIImageView!
    private var user = User()
    
    func setUser(user: User) {
        self.user = user
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        func setup() {
            uiSetup()
            setData()
        }
        
        setup()
    }
    private func uiSetup(){
        self.imageProfile.setCornerRadius(radius: self.imageProfile.frame.size.height/2, borderwidth: 4, borderColor: UIColor.black)
    }

    private func setData() {
        self.nameLable.text = user.name
        self.emailLable.text = user.email
        let url = URL(string: user.image ?? "")
        let data = try? Data(contentsOf: url!)
        imageProfile.image = UIImage(data: data!)
    }
    
    @IBAction func btnLogoutAction (_ sender:UIButton){
        showSimpleAlert()
    }

    func showSimpleAlert() {
        let alert = UIAlertController(title: "Sign out?", message: "You can always access your content by signing back", preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: { _ in
            //Cancel Action
        }))
        alert.addAction(UIAlertAction(title: "Sign out",style: UIAlertAction.Style.default,handler: {(_: UIAlertAction!) in LoginManager().logOut()
            self.navigationController?.popViewController(animated: true)
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
