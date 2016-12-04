//
//  ViewController.swift
//  Diabhelp
//
//  Created by Sumbers on 18/11/16.
//  Copyright © 2016 Sumbers. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        emailField.delegate = self
        pwdField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var pwdField: UITextField!
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if (textField === emailField){
            emailField.resignFirstResponder()
        }
        else if (textField === pwdField){
            pwdField.resignFirstResponder()
        }
        return true
    }
    
    //MARK: actions
    
    @IBAction func login(_ sender: UIButton) {
        print("valeurs des champs : \n email: \(emailField.text) \n pwd: \(pwdField.text)")
        let api: ApiConnector = ApiConnector()
        let url: String = api.getServerUrl(state: .Prod).replacingOccurrences(of: "/api", with: "") + "rest-login"
        print("url = " + url)
        if let login = emailField.text, let pwd = pwdField.text {
            let parameters: Parameters = ["username": login, "password": pwd]
            Alamofire.request(url, method: .post, parameters: parameters).validate()
                .responseJSON { response in
                    debugPrint(response)
            }
            
        }
        
    }
    
}

