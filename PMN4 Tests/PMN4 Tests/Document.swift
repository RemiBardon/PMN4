//
//  Document.swift
//  PMN4 Tests
//
//  Created by BARDON Rémi on 11/03/2020.
//  Copyright © 2020 BARDON Rémi. All rights reserved.
//

import UIKit

class Document: UIDocument {
    
    override func contents(forType typeName: String) throws -> Any {
        // Encode your document with an instance of NSData or NSFileWrapper
        return Data()
    }
    
    override func load(fromContents contents: Any, ofType typeName: String?) throws {
        // Load your document from contents
    }
}

