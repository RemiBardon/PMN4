//
//  Bateau.swift
//  PortPlaisance
//
//  Created by BARDON Rémi on 29/01/2020.
//  Copyright © 2020 BARDON Rémi. All rights reserved.
//

import Foundation

class Bateau {
	
	enum Motorisation { case voile, moteur }
	
	let codeMaritime: String
	let puissance: Float
	let motorisation: Motorisation
	let longueur: Float
	let largeur: Float
	let profondeur: Float
	
	var nom: String
	var modele: String
	
	weak var emplacement: Emplacement?
	
	init(codeMaritime: String, nom: String, modele: String, motorisation: Motorisation, puissance: Float, longueur: Float, largeur: Float, profondeur: Float) {
		self.codeMaritime 	= codeMaritime
		self.nom 			= nom
		self.modele 		= modele
		self.motorisation 	= motorisation
		self.puissance 		= puissance
		self.longueur 		= longueur
		self.largeur 		= largeur
		self.profondeur 	= profondeur
	}
	
	func changerEmplacement(a emplacement: Emplacement) {
		guard emplacement.longueur > longueur else {
			#if DEBUG
			print("\(type(of: self)).\(#function): L'emplacement n'est pas assez long")
			#endif
			return
		}
		guard emplacement.largeur > largeur else {
			#if DEBUG
			print("\(type(of: self)).\(#function): L'emplacement n'est pas assez large")
			#endif
			return
		}
		guard emplacement.profondeur > profondeur else {
			#if DEBUG
			print("\(type(of: self)).\(#function): L'emplacement n'est pas assez profond")
			#endif
			return
		}
		
		self.emplacement = emplacement
	}
	
	func quitterEmplacement() {
		self.emplacement = nil
	}
	
}
