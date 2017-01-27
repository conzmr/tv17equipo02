//
//  contractTableViewController.swift
//  
//
//  Created by Juan Andrés Rocha Díaz on 26/01/17.
//
//

import UIKit
import Firebase

class contractTableViewController: UITableViewController {
    
    //Variables passed from list
    var specialty:String = ""
    var service:String = ""
    var userid = FIRAuth.auth()?.currentUser?.uid
    var ref:FIRDatabaseReference! = FIRDatabase.database().reference()
    var userinfo:[String:AnyObject] = [:]

    @IBOutlet weak var request: roundedButton!

    @IBOutlet weak var street: UITextField!
    @IBOutlet weak var city: UITextField!
    @IBOutlet weak var state: UITextField!
    @IBOutlet weak var zipcode: UITextField!
    @IBOutlet weak var medicine: UITextField!
    @IBOutlet weak var status: UITextField!
    @IBOutlet weak var diagnosis: UITextField!
    @IBOutlet weak var requests: UITextField!
    @IBOutlet weak var allergies: UITextField!
    @IBOutlet weak var radiation: UITextField!
    @IBOutlet weak var chemo: UITextField!
    @IBOutlet weak var surgery: UITextField!
    @IBOutlet weak var comments: UITextField!
    @IBOutlet weak var accept: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        print(specialty)
        print(service)
        print(userid)
        
    }
  
    @IBAction func requestFee(_ sender: Any) {
        
        //Quizá agregar un id
        let data1 = ["userid":self.userid, "street": self.street.text, "city": self.city.text, "state":self.state.text, "zipcode": self.zipcode.text, "medication": self.medicine.text, "clinicalstatus": self.status.text, "diagnosis": self.diagnosis.text, "specialrequest": self.requests.text, "allergies": self.allergies.text, "radiation": self.radiation.text, "chemo":self.chemo.text, "surgery": self.surgery.text, "comment":self.comments.text]
        
        self.ref.child("requests").child(userid!+specialty).setValue(data1)
        
        print("success")
    }

}
