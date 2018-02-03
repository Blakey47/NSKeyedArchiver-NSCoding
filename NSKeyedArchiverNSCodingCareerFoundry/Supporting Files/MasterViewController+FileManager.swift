//
//  MainViewController+FileManager.swift
//  NSKeyedArchiverNSCodingCareerFoundry
//
//  Created by Darragh on 2/2/18.
//  Copyright © 2018 Darragh. All rights reserved.
//

import UIKit

extension MasterViewController {
    var filePath: String? {
        do {
            let fileManager = FileManager.default
            let documentDirectory = try fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            let savePath = documentDirectory.appendingPathComponent("people.bin")
            return savePath.path
        } catch let ErrPath {
            print("Error getting path:", ErrPath )
            return nil
        }
    }
}
