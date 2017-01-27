//
//  RecommendationModel.swift
//  
//
//  Created by Juan Andrés Rocha Díaz on 27/01/17.
//
//

import Foundation
import UIKit

struct RecommendationModel {
    static let sharedInstance = RecommendationModel()
    
    let headers:[Header]
    
    init() {
        //Specialties

        let wyndham = Obj(name: "Wyndham Garden Guadalajara Acueducto", address: "AvenidaReal Acueducto No 360 Colonia Puerta De Hierro, Zapopan", phone: "3338394250", img: #imageLiteral(resourceName: "wynd"))
        
        let hyatt = Obj(name: "Hyatt Regency Andares Guadalajara", address: "Puerta de Hierro 4965 Zapopan, Jalisco, México", phone: "3338831234", img: #imageLiteral(resourceName: "hyatt"))
        
        let holiday = Obj(name: "Holiday Inn Express Guadalajara Autonoma", address: "Av. Patria 999, Jardines Universidad, Uag, 45110 Guadalajara, Jal.", phone: "3336480060", img: #imageLiteral(resourceName: "holiday"))
        
        let nh = Obj(name: "NH Collection Guadalajara", address: "São Paulo 2334, Providencia", phone: "33 3648 9500", img: #imageLiteral(resourceName: "nh"))
        
        //Hotels
        let hotels = Header(name: "Hotels", object: [wyndham, hyatt, holiday, nh])
        
        let  docena = Obj(name: "La Docena", address:"Boulevard Puerta de Hierro 4965, Puerta de Hierro", phone: "3336110635", img:#imageLiteral(resourceName: "docena"))
        let pfchangs = Obj(name: "PF Chang's", address:"Blvd. Paseo Andares 434, Puerta de Hierro, Zapopan, Jalisco", phone: "33 3611 3294", img: #imageLiteral(resourceName: "pfchangs"))
        let cafeto = Obj(name: "Cafeto", address: "Av. de los Empresarios 371, Puerta de Hierro, Zapopan, Jalisco", phone: "33 1944 0823", img: #imageLiteral(resourceName: "cafeto"))
        let almacen = Obj(name: "El Almacén del Bife", address: "Andares, Blvd. Puerta de Hierro 4965, Puerta de Hierro", phone: " 3336112669", img: #imageLiteral(resourceName: "almacen"))
        let pasteria = Obj(name: "La Pastería", address: "Blvrd Puerta de Hierro 4965, Zapopan, Jalisco", phone: "None", img: #imageLiteral(resourceName: "pasteria"))
        //Restaurant
        let restaurants = Header(name: "Restaurants", object: [docena, pfchangs, cafeto, almacen, pasteria])
        
        let andares = Obj(name: "Plaza Andares", address: "Blvd. Puerta de Hierro No. 4965, Fracc. Plaza Andares, Zapopan, Jalisco", phone: "none", img: #imageLiteral(resourceName: "andares"))
        let basilica = Obj(name: "Basílica de Zapopan", address: "Eva Briseño 152, Zapopan, Centro", phone: "None", img: #imageLiteral(resourceName: "zapopa"))
        let colomos = Obj(name: "Bosque Colomos", address: "El Chaco 3200, Providencia, Zapopan, Jalisco", phone: "None", img: #imageLiteral(resourceName: "colomos"))
        let museo = Obj(name: "Museo de Zapopan", address: "Prol. 20 De Noviembre 20, Zapopan", phone: "3338182575", img: #imageLiteral(resourceName: "museo"))
        
        //Entertainment
        let entertainment = Header(name: "Entertainment", object: [andares, basilica, colomos, museo])
        
        
        headers = [hotels, restaurants, entertainment]
        
    }
    
}

struct Header {
    let name:String
    let object:[Obj]
}

struct Obj {
    let name:String
    let address:String
    let phone:String
    let img: UIImage
}
