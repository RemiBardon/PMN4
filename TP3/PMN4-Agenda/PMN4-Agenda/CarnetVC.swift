//
//  CarnetVC.swift
//  PMN4-Agenda
//
//  Created by BARDON Rémi on 19/02/2020.
//  Copyright © 2020 BARDON Rémi. All rights reserved.
//

import UIKit

class CarnetVC: UITableViewController {
	
	// MARK: - Properties

	@IBOutlet weak var studentNameTextField: UITextField!
	@IBOutlet weak var passwordTextField: UITextField!
	@IBOutlet weak var studentCountLabel: UILabel!
	
	@IBOutlet weak var passwordResearchNameTextField: UITextField!
	@IBOutlet weak var passwordLabel: UILabel!
	@IBOutlet weak var encryptedPasswordLabel: UILabel!
	
	@IBOutlet weak var nameResearchFilterTextField: UITextField!
	@IBOutlet weak var nameResearchResultTextField: UILabel!
	
	// MARK: - Lifecycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		createDismissKeyboardTapGesture()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		studentCountLabel.text = String(Agenda.carnet.count)
	}
	
	// MARK: - Actions

	@IBAction func addStudentTapped(_ sender: Any) {
		addStudent()
	}
	
	@IBAction func encryptDataTapped(_ sender: Any) {
		Agenda.sauvegarder()
	}
	
	@IBAction func searchPasswordTapped(_ sender: Any) {
		searchPassword()
	}
	
	@IBAction func searchNameTapped(_ sender: Any) {
		searchName()
	}
	
	// MARK: - Methods
	
	private func addStudent() {
		guard let identifiant = studentNameTextField.text, !identifiant.isEmpty,
			let motDePasse = passwordTextField.text, !motDePasse.isEmpty else { return }
		
		Agenda.ajouterEtudiant(identifiant: identifiant, motDePasse: motDePasse)
		
		studentCountLabel.text 		= String(Agenda.carnet.count)
		studentNameTextField.text 	= ""
		passwordTextField.text 		= ""
		
		studentNameTextField.resignFirstResponder()
		passwordTextField.resignFirstResponder()
	}
	
	private func searchPassword() {
		guard let identifiant = passwordResearchNameTextField.text,
			!identifiant.isEmpty else { return }
		
		if let password = Agenda.retrouverMotDePasse(pourIdentifiant: identifiant) {
			passwordLabel.text 		= password
			passwordLabel.textColor = .label
		} else {
			passwordLabel.text 		= "Aucun résultat"
			passwordLabel.textColor = .secondaryLabel
		}
		
		if let encryptedPassword = Agenda.carnet[identifiant] {
			encryptedPasswordLabel.text 		= encryptedPassword
			encryptedPasswordLabel.textColor 	= .label
		} else {
			encryptedPasswordLabel.text 		= "Aucun résultat"
			encryptedPasswordLabel.textColor 	= .secondaryLabel
		}
		
		passwordResearchNameTextField.resignFirstResponder()
	}
	
	private func searchName() {
		guard let filtre = nameResearchFilterTextField.text,
			!filtre.isEmpty else { return }
		
		let identifiants = Agenda.retrouverIdentifiant(pourFiltre: filtre)
		if !identifiants.isEmpty {
			nameResearchResultTextField.text 		= identifiants[0]
			nameResearchResultTextField.textColor 	= .label
		} else {
			nameResearchResultTextField.text 		= "Aucun résultat"
			nameResearchResultTextField.textColor 	= .secondaryLabel
		}
		
		nameResearchFilterTextField.resignFirstResponder()
	}
	
    func createDismissKeyboardTapGesture() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
	
}

// MARK: - UITextFieldDelegate

extension CarnetVC: UITextFieldDelegate {
	
	func textFieldDidBeginEditing(_ textField: UITextField) {
		tableView.scrollRectToVisible(textField.frame, animated: true)
	}
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		switch textField {
		case studentNameTextField:
			passwordTextField.becomeFirstResponder()
		case passwordTextField:
			addStudent()
		case passwordResearchNameTextField:
			searchPassword()
		case nameResearchFilterTextField:
			searchName()
		default:
			break
		}
		
		return textField.resignFirstResponder()
	}
	
}
