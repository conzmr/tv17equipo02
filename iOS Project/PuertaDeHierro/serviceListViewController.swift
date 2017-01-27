//
//  serviceListViewController.swift
//  PuertaDeHierro
//
//  Created by Juan Andrés Rocha Díaz on 26/01/17.
//  Copyright © 2017 Juan Andrés Rocha Díaz. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth
import PKHUD

class serviceListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var specialty:String = ""
    var index:Int = 0
    
    var services:[String: AnyObject] = [:]
    var keys:[String] = []
    
    var selected:String = ""
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        PKHUD.sharedHUD.show()
        retrieveServices()
        titleLabel.text = specialty
        descLabel.text = ServicesModel.sharedInstance.sections[0].object[index].desc
        image.image = ServicesModel.sharedInstance.sections[0].object[index].img
        print(self.specialty)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func retrieveServices() {
        let ref:FIRDatabaseReference! = FIRDatabase.database().reference()
        ref.child("specialties").child(self.specialty).child("services").observeSingleEvent(of: .value, with: { (snapshot) in
            self.services = snapshot.value as! [String: AnyObject]
            //Getting keys into array
            for (key, values) in self.services {
                self.keys.append(key)
            }
            print(self.keys)
            print(self.services)
            self.table.reloadData()
        })

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("number of rows")
        print(self.services.count)
       return self.services.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "serviceCell") as! serviceCellTableViewCell
        let serv = self.keys[indexPath.row]
        cell.titleLabel.text = serv
        cell.subtitleLabel.text = self.services[serv]!["desc"]! as! String
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (FIRAuth.auth()?.currentUser) != nil {
            // User is signed in.
            self.selected = self.keys[indexPath.row]

            performSegue(withIdentifier: "contractSegue", sender: self)
        } else {
            // No user is signed in.
            performSegue(withIdentifier: "loginContract", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "contractSegue"){
            let destination:contractTableViewController = segue.destination as! contractTableViewController
            destination.specialty = self.specialty
            destination.service = self.selected
        }
    }
    

}
