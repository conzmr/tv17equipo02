//
//  ServiceModel.swift
//  
//
//  Created by Juan Andrés Rocha Díaz on 26/01/17.
//
//

import Foundation
import UIKit

struct ServicesModel {
    static let sharedInstance = ServicesModel()
    
    //Section declaration
    let sections:[Section]
    
    init() {
        //Specialties
        let angiology = Object(name: "Angiology", desc: "Blood treatment", img: #imageLiteral(resourceName: "angiology"))
        let anesthesiology = Object(name: "Anesthesiology", desc: "Blood treatment", img: #imageLiteral(resourceName: "Anesthesiology"))
        let allergology = Object(name: "Allergology", desc: "Blood treatment", img: #imageLiteral(resourceName: "allergology"))
        let cardiology = Object(name: "Cardiology", desc: "Blood treatment", img: #imageLiteral(resourceName: "cardio"))
        let plastic = Object(name: "Plastic Surgery", desc: "Blood treatment", img: #imageLiteral(resourceName: "plastic-surgery-Myths"))
        let dermatology = Object(name: "Dermatology", desc: "Blood treatment", img: #imageLiteral(resourceName: "derma"))
        let ophthalmology = Object(name: "Ophthalmology", desc: "Blood treatment", img: #imageLiteral(resourceName: "opthalmology_care"))
        let pediatrics = Object(name: "Pediatrics", desc: "Blood treatment", img: #imageLiteral(resourceName: "pediatrician"))
        
        let services = Section(name: "Services", object: [angiology, anesthesiology, allergology, cardiology, plastic, dermatology, ophthalmology, pediatrics])
        
        //Hospitals
        let matriz = Object(name: "Puerta de Hierro", desc: "Zapopan, Jal.", img: #imageLiteral(resourceName: "pdh"))
        let sur = Object(name: "Puerta de Hierro Sur", desc: "Zapopan, Jal.", img: #imageLiteral(resourceName: "pdhsur"))
        let tepic = Object(name: "Puerta de Hierro Tepic", desc: "Zapopan, Jal.", img: #imageLiteral(resourceName: "pdhtepic"))
        let colima = Object(name: "Puerta de Hierro Colima", desc: "Zapopan, Jal.", img: #imageLiteral(resourceName: "pdhcolima"))
        
        let hospitals = Section(name: "Hospitals", object: [matriz, sur, tepic, colima])
        
        sections = [services, hospitals]

    }
    
}

struct Section {
    let name:String
    let object:[Object]
}

struct Object {
    let name: String
    let desc: String
    let img: UIImage
}
