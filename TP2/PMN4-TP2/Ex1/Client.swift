//
//  Client.swift
//  PMN4-TP2
//
//  Created by BARDON Rémi on 05/02/2020.
//  Copyright © 2020 BARDON Rémi. All rights reserved.
//

import Foundation

class Client: NSObject {
	
	var nom: String
	var prenom: String
	var adresse: Adresse
	
	override var description: String { "\(prenom) \(nom): \(adresse)" }
	
	init(nom: String, prenom: String, adresse: Adresse) {
		self.nom 		= nom
		self.prenom 	= prenom
		self.adresse 	= adresse
	}
	
}
