//
//  main.swift
//  PortPlaisance
//
//  Created by BARDON Rémi on 29/01/2020.
//  Copyright © 2020 BARDON Rémi. All rights reserved.
//

import Foundation

let bateau = Bateau(codeMaritime: "CodeMar", nom: "Nom", modele: "Modele", motorisation: .voile, puissance: 12, longueur: 8, largeur: 2, profondeur: 0.8)

let emplacement1 = Emplacement(longueur: 10, largeur: 3, profondeur: 1)
bateau.changerEmplacement(a: emplacement1)

let emplacement2 = Emplacement(longueur: 12, largeur: 4, profondeur: 2)
bateau.changerEmplacement(a: emplacement2)

bateau.quitterEmplacement()
