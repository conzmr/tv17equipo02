//
//  loginViewController.swift
//  PuertaDeHierro
//
//  Created by Juan Andrés Rocha Díaz on 25/01/17.
//  Copyright © 2017 Juan Andrés Rocha Díaz. All rights reserved.
//

import UIKit
import Firebase

class loginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var logButton: roundedButton!
    @IBOutlet weak var mailText: UITextField!
    @IBOutlet weak var passText: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        passText.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func logInPressed(_ sender: Any) {

        if mailText.text == "" || passText.text == "" {
            let alertController = UIAlertController(title: "Hold on!", message: "Write your email/password.", preferredStyle: .alert)
            
            let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(action)
            present(alertController, animated: true, completion: nil)
        }
        else {
            FIRAuth.auth()?.signIn(withEmail: mailText.text!, password: passText.text!) { (user, error) in
                if error == nil {
                    //Login correcto
                    print("Yaayyy")
                    let view = self.storyboard?.instantiateViewController(withIdentifier: "Homepage")
                    self.present(view!, animated: true, completion: nil)
                }
                else {
                    let alert = UIAlertController(title: "Wrong password", message: "Your email/password combination is wrong. Please try again.", preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alert.addAction(action)
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        passText.resignFirstResponder()
        return true
    }
    

}
