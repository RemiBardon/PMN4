//
//  Compte.swift
//  PMN4-TP2
//
//  Created by BARDON Rémi on 05/02/2020.
//  Copyright © 2020 BARDON Rémi. All rights reserved.
//

import Foundation

class Compte {
	
	let numeroCB: String 		= UUID().uuidString
	let dateExpiration: String 	= Date(timeIntervalSinceNow: TimeInterval(60 * 60 * 24 * 365 * 10)).description
	let type: TypeCarte
	var compteCourant: String
	var solde: Double 			= 0.0
	var agence: Agence
	var client: Client
	
	init(type: TypeCarte = .classic, compteCourant: String, agence: Agence, client: Client) {
		self.type 			= type
		self.compteCourant 	= compteCourant
		self.agence 		= agence
		self.client 		= client
	}
	
}
