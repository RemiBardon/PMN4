//
//  main.swift
//  PMN4-TP2
//
//  Created by BARDON Rémi on 05/02/2020.
//  Copyright © 2020 BARDON Rémi. All rights reserved.
//

import Foundation

print("Exercice 1 :\n")

func creerAgence(_ id: Int, de banque: String, au num: Int, _ voie: String, _ codePostal: String, _ ville: String) -> Agence {
	let adresse = Adresse(num: num, voie: voie, codePostal: codePostal, ville: ville)
	return Agence(id, adresse: adresse, banque: banque)
}

func creerClient(nom: String, prenom: String, au num: Int, _ voie: String, _ codePostal: String, _ ville: String) -> Client {
	let adresse = Adresse(num: num, voie: voie, codePostal: codePostal, ville: ville)
	return Client(nom: nom, prenom: prenom, adresse: adresse)
}

let agence1 = creerAgence(256, de: "Crédit Agricole", au: 15, "rue François de Vaux de Foletier", "17000", "La Rochelle")
print("Agence exercice 1 : \(agence1.description)")

let tousLesComptes: [Compte] = {
	let agences: [Agence] = [
		agence1,
		creerAgence(1, de: "BNP Paribas", au: 12, "rue François de Vaux de Foletier", "17000", "La Rochelle"),
		creerAgence(2, de: "BNP Paribas", au: 25, "rue François de Vaux de Foletier", "17000", "La Rochelle"),
		creerAgence(1, de: "Société Générale", au: 32, "rue François de Vaux de Foletier", "17000", "La Rochelle")
	]
	let clients: [Client] = [
		creerClient(nom: "Bardon", prenom: "Remi", au: 5, "rue sdhfbnaei", "17000", "La Rochelle"),
		creerClient(nom: "Bardon", prenom: "Théo", au: 24, "rue qfhjdbsa", "86100", "Poitiers"),
		creerClient(nom: "Bardon", prenom: "Emma", au: 13, "rue azrtrytu", "79100", "Thouars")
	]
	let comptes: [Compte] = [
		Compte(compteCourant: UUID().uuidString, agence: agences[0], client: clients[0]),
		Compte(compteCourant: UUID().uuidString, agence: agences[1], client: clients[0]),
		Compte(compteCourant: UUID().uuidString, agence: agences[1], client: clients[1]),
		Compte(compteCourant: UUID().uuidString, agence: agences[2], client: clients[1]),
		Compte(compteCourant: UUID().uuidString, agence: agences[3], client: clients[2])
	]
	
	return comptes
}()

let clientsBNP = Set(tousLesComptes.filter({ $0.agence.banque == "BNP Paribas" }).map({ $0.client }))
print("\nClients BNP : \(clientsBNP)")

let adressesClientsSocieteGenerale = Set(tousLesComptes.filter({ $0.agence.banque == "Société Générale" }).map({ $0.client.adresse }))
print("\nAdresses des clients de la Société Générale : \(adressesClientsSocieteGenerale)")

print("\nExercice 2 :\n")

let identifiants = ["rbardon", "aaudoi01", "vlambert", "rmignon", "lvivier", "mberti02"]
let motsDePasse = ["unMotDePasseSimple", "azertyuiop", "12345", "0000", "bonjour", "HelloWorld!"]
Agenda.ajouterEtudiant(
	identifiant: identifiants.randomElement()!,
	motDePasse: motsDePasse.randomElement()!
)
print(Agenda.carnet)
var carnetDecrypte = [String:String]()
for identifiant in identifiants {
	if let mdp = Agenda.retrouverMotDePasse(pourIdentifiant: identifiant) { carnetDecrypte[identifiant] = mdp }
}
print(carnetDecrypte)

print(Agenda.retrouverIdentifiant(pourFiltre: "er"))

Agenda.sauvegarder()
