//
//  Agenda.swift
//  PMN4-TP2
//
//  Created by BARDON Rémi on 05/02/2020.
//  Copyright © 2020 BARDON Rémi. All rights reserved.
//

import Foundation

public class Agenda {
	
	private static let laTableCryptage: [Character:Character] = {
//		let alphabet = "azertyuiopqsdfghjklmwxcvbnnAZERTYUIOPQSDFGHJKLMWXCVBN1234567890".shuffled()
//		var laTable = [Character:Character]()
//		alphabet.shuffled().enumerated().forEach {
//			laTable[$0.element] = alphabet[$0.offset]
//		}
		let alphabet1 = Array("azertyuiopqsdfghjklmwxcvbnnAZERTYUIOPQSDFGHJKLMWXCVBN1234567890")
		let alphabet2 = Array("iFBTItyvuHUqaSn0f3NZQDw9Y68EKlLbzXojxp1WsOdg4nVRM7AkcmGPJhC5e2r")
		var laTable = [Character:Character]()
		alphabet2.enumerated().forEach {
			laTable[$0.element] = alphabet1[$0.offset]
		}
		return laTable
	}()
	
	private static let laTableDecryptage: [Character:Character] = {
		var laTable = [Character:Character]()
		for element in Agenda.laTableCryptage {
			laTable[element.value] = element.key
		}
		return laTable
	}()
	
	public static var carnet: [String:String] = {
		// Read carnet.plist
//		guard let plist = NSArray(contentsOfFile: "carnet.plist"), plist.count > 0 else { return [:] }
//		return (plist[0] as? [String: String]) ?? [:]
		(NSDictionary(contentsOfFile: "carnet.plist") as? [String: String]) ?? [:]
	}()
	
	private static func crypter(_ texte: String) -> String {
		String(texte.map({ Agenda.laTableCryptage[$0] ?? $0 }))
	}
	
	private static func decrypter(_ texte: String) -> String {
		String(texte.map({ Agenda.laTableDecryptage[$0] ?? $0 }))
	}
	
	public static func ajouterEtudiant(identifiant: String, motDePasse: String) {
		Agenda.carnet[identifiant] = crypter(motDePasse)
	}
	
	public static func sauvegarder() {
//		var plist = [AnyHashable]()
//		plist.append(Agenda.carnet)
//		(plist as NSArray).write(toFile:"carnet.plist", atomically: true)
		(Agenda.carnet as NSDictionary).write(toFile: "carnet.plist", atomically: true)
//		(Agenda.carnet as NSDictionary).write(to: URL(fileURLWithPath: "/Users/bardonremi/Documents/IUT/S4/PMN4/PMN4-TP2/carnet.plist"), atomically: true)
//		(Agenda.carnet as NSDictionary).write(to: URL(fileURLWithPath: "carnet.plist"), atomically: true)
	}
	
	public static func retrouverMotDePasse(pourIdentifiant identifiant: String) -> String? {
		guard let motDePasseCrypte = Agenda.carnet[identifiant] else { return nil }
		return decrypter(motDePasseCrypte)
	}
	
	public static func retrouverIdentifiant(pourFiltre filtre: String) -> [String] {
		var filtres = filtre.split(separator: "*")

		guard !filtres.isEmpty else { return [] }
		
		var identifiants = Array(Agenda.carnet.keys)

		// Contains
		while !(filtres.isEmpty || identifiants.isEmpty) {
			identifiants = identifiants.filter { $0.contains(filtres[0]) }
			filtres.removeFirst()
		}

		return identifiants
	}
	
}
