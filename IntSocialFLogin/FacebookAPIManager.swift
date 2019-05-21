//
//  FacebookAPIManager.swift
//  IntSocialFLogin
//
//  Created by Vinod Tiwari on 21/05/19.
//  Copyright © 2019 Intellarc. All rights reserved.
//

import Foundation
import UIKit
import FBSDKLoginKit

let kGraphPathMe = "me"
let kGraphPathMePageLikes = "me/likes"

class FacebookAPIManager {

  func loginWithFacebook(fromController: UIViewController, completion: @escaping (User?, Error?)->()) {
        let fbLoginManager : LoginManager = LoginManager()
        fbLoginManager.logIn(permissions: ["email"], from: fromController) { (result, error) in
            print("\n\n result: \(String(describing: result))")
            print("\n\n Error: \(String(describing: error))")
            
            if (error == nil)
            {
                let fbloginresult : LoginManagerLoginResult = result!
                if(fbloginresult.isCancelled) {
                    //Show Cancel alert
                    print("Cancel Alert")
                } else if(fbloginresult.grantedPermissions.contains("email")) {
                    self.returnUserData(completion: { (user, error) in
                        if let user = user{
                            completion(user, nil)
                        }else{
                            completion(nil, error)
                        }
                    })
                }
                
            }else{
                completion(nil, error)
            }
        }
    }
    
    
    private func returnUserData(completion: @escaping (User?, Error?)->())
    {
        let graphRequest : GraphRequest = GraphRequest(graphPath: kGraphPathMe, parameters: ["fields":"email,name,picture"])
        graphRequest.start(completionHandler: { (connection, result, error) -> Void in
            if ((error) != nil)
            {
                print("\n\n Error: \(String(describing: error))")
                completion(nil, error)
            }
            else
            {
                let resultDic = result as! NSDictionary
                //let fbId = resultDic["id"] as? String ?? ""
                let url = ((resultDic["picture"] as? [String: Any])?["data"] as? [String: Any])?["url"] as? String ?? ""
                print("Image url = \(url)")
                let strEmail = resultDic["email"] as? String ?? ""
                let strName = resultDic["name"] as? String ?? ""
                let model = User.init(name: strName, email: strEmail, image: url)
                print(model)
                // return model
                completion(model, nil)
            }
        })
    }
}


