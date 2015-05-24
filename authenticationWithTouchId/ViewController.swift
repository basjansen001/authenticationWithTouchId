//
//  ViewController.swift
//  authenticationWithTouchId
//
//  Created by Bas Jansen on 24-05-15.
//  Copyright (c) 2015 Bas Jansen. All rights reserved.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

  func authenticateUserWithTouchId() {
      var myContext = LAContext()
      var error: NSError?
      var myLocalizedReasonString = "For authentication purposes, we need to authenticate you with your fingermark!"
		
      if myContext.canEvaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics, error: &error) {
          myContext.evaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics, localizedReason: myLocalizedReasonString, reply: { (var succes: Bool, var error: NSError?) -> Void in
          if succes {
              // Succesfully authenticated
          } else {
              // User did not authenticate succesfully, look at the error and take appropriate action
          }
          })
      } else {
          // Could not evelaute policy; look at authError and present an appropriate message to user.
      }
   }
	
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
    @IBAction func authenticate() {
        self.authenticateUserWithTouchId()
    }
}

