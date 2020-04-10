//
//  Agence.swift
//  PMN4-TP2
//
//  Created by BARDON Rémi on 05/02/2020.
//  Copyright © 2020 BARDON Rémi. All rights reserved.
//

import Foundation

class Agence: NSObject {
	
	let numero: Int
	var adresse: Adresse
	let banque: String
	
	override var description: String { "\(banque) #\(numero): \(adresse)" }
	
	init(_ numero: Int, adresse: Adresse, banque: String) {
		self.numero = numero
		self.adresse = adresse
		self.banque = banque
	}
	
}
