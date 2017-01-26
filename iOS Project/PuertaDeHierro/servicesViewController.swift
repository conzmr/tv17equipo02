//
//  servicesViewController.swift
//  
//
//  Created by Juan Andrés Rocha Díaz on 26/01/17.
//
//

import UIKit
import FirebaseAuth

protocol ShowOptionsDelegate {
    func showOptions(name:String, option:Int)
}


class servicesViewController: UIViewController, UITableViewDataSource, ShowOptionsDelegate {
    
    @IBOutlet weak var table: UITableView!
    
    var hospitalnames = ["Puerta de Hierro", "Puerta de Hierro Sur", "Puerta de Hierro Tepic", "Puerta de Hierro Colima"]
    var hospitalphones = ["523338482100","523330407000","523111295200","523123162400"]
    var hospitalmaps = ["http://maps.apple.com/?address=150,Av+Empresarios,Zapopan,Jalisco", "http://maps.apple.com/?address=1401,Av+Adolfo+Lopez+Mateos,Guadalajara,Jalisco", "http://maps.apple.com/?q=hospital+de+especialidades+puerta+de+hierro+tepic", "http://maps.apple.com/?address=1699,Av+Ingacio+Sandoval,Colima,Colima"]

    
    var selectedoption:Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        table.dataSource = self
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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return ServicesModel.sharedInstance.sections.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return ServicesModel.sharedInstance.sections[section].name
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! SectionRow
        cell.cat = ServicesModel.sharedInstance.sections[indexPath.section]
        cell.delegate = self
        return cell
    }
    
    //ShowOptionsDelegate:
    func showOptions(name: String, option: Int) {
        print(name)
        print(option)
        
        self.selectedoption = option
        
        if(name == "Hospitals"){
            let actions = UIAlertController(title: self.hospitalnames[option], message: "What do you want to do?", preferredStyle: .actionSheet)
            actions.addAction(UIAlertAction(title: "Phone Call", style: .default, handler: { (action) in
                
                //Phone number URL
                if let phonecall = URL(string: "tel://\(self.hospitalphones[option])") {
                    UIApplication.shared.open(phonecall, options: [:], completionHandler: nil)
                }
            }))
            actions.addAction(UIAlertAction(title: "Directions", style: .default, handler: { (action) in
                //Maps connection URL
                if let maps = URL(string: self.hospitalmaps[option]) {
                    UIApplication.shared.open(maps, options: [:], completionHandler: nil)
                }
                
            }))
            actions.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler:nil))
            
            self.present(actions, animated:true, completion:nil)
        }
        else{
            performSegue(withIdentifier: "listServices", sender: self)
        }
    }
    
    //Prepare for segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination:serviceListViewController = segue.destination as! serviceListViewController
        destination.specialty = ServicesModel.sharedInstance.sections[0].object[selectedoption].name
        destination.index = self.selectedoption
    }
    
}


