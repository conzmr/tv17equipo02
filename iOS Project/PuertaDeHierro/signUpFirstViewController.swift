//
//  signUpFirstViewController.swift
//  PuertaDeHierro
//
//  Created by Juan Andrés Rocha Díaz on 25/01/17.
//  Copyright © 2017 Juan Andrés Rocha Díaz. All rights reserved.
//

import UIKit

class signUpFirstViewController: UIViewController {

    @IBOutlet weak var continueBtn: roundedButton!
    
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var lastNameText: UITextField!
    @IBOutlet weak var mailText: UITextField!
    @IBOutlet weak var passText: UITextField!
    @IBOutlet weak var genderText: UITextField!
    @IBOutlet weak var birthdayText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    @IBAction func continuePressed(_ sender: Any) {
        performSegue(withIdentifier: "suContinue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination:signUpSecondViewController = segue.destination as! signUpSecondViewController
        
        destination.name = (nameText.text)!
        destination.lastName = (lastNameText.text)!
        destination.mail = (mailText.text)!
        destination.pass = (passText.text)!
        destination.gender = (genderText.text)!
        destination.bday = (birthdayText.text)!
        
        
    }

}
