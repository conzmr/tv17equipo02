//
//  signUpSecondViewController.swift
//  PuertaDeHierro
//
//  Created by Juan Andrés Rocha Díaz on 25/01/17.
//  Copyright © 2017 Juan Andrés Rocha Díaz. All rights reserved.
//

import UIKit
import Firebase

class signUpSecondViewController: UIViewController {

    var name:String = ""
    var lastName:String = ""
    var mail:String = ""
    var pass:String = ""
    var gender:String = ""
    var bday:String = ""
    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var doneButton: roundedButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        welcomeLabel.text = "Welcome, " + name
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func createAccount(_ sender: Any) {
        FIRAuth.auth()?.createUser(withEmail: mail, password: pass) { (user, error) in
            if error == nil {
                print("success!!")
                //Agregar info a la base de datos
                self.ref.child("Usuarios").setValue(user?.uid)
            } else {
                print("didnt work, nigga")
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
