//
//  signUpSecondViewController.swift
//  PuertaDeHierro
//
//  Created by Juan Andrés Rocha Díaz on 25/01/17.
//  Copyright © 2017 Juan Andrés Rocha Díaz. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase


class signUpSecondViewController: UIViewController {

    var name:String = ""
    var lastName:String = ""
    var mail:String = ""
    var pass:String = ""
    var gender:String = ""
    var bday:String = ""
    var ref:FIRDatabaseReference! = FIRDatabase.database().reference()
    
    @IBOutlet weak var countryTxt: UITextField!
    @IBOutlet weak var weightTxt: UITextField!
    @IBOutlet weak var phoneTxt: UITextField!
    @IBOutlet weak var heightTxt: UITextField!
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
        let country:String = self.countryTxt.text!
        let weight = self.weightTxt.text!
        let phone = self.phoneTxt.text!
        let height = self.heightTxt.text!
        
        FIRAuth.auth()?.createUser(withEmail: mail, password: pass) { (user, error) in
            if error == nil {
                print("success!!")
                //Agregar info a la base de datos
                
                let data = ["name" : self.name, "lastname": self.lastName, "mail": self.mail, "gender": self.gender, "birthdate": self.bday, "country":country, "weight": weight, "phone": phone, "height": height]
                
                self.ref.child("users").child((user?.uid)!).setValue(data)
            } else {
                let alert = UIAlertController(title: "There was an error.", message: "Please try again later..", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
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
