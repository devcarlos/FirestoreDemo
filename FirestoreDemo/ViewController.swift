//
//  ViewController.swift
//  FirestoreDemo
//
//  Created by Carlos Alcala on 2/17/20.
//  Copyright © 2020 Kurrentap. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    let db = Firestore.firestore()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func saveData() {
        // Add a new document with a generated ID
        var ref: DocumentReference? = nil

        ref = db.collection("users").addDocument(data: [
            "first": "Ada",
            "last": "Lovelace",
            "born": 1815
        ]) { error in
            guard error == nil else {
                print("Error adding document: \(String(describing: error))")
                return
            }
            print("Document added with ID: \(ref!.documentID)")
        }
    }

    func getData() {
        db.collection("users").getDocuments() { (querySnapshot, error) in
            guard error == nil else {
                print("Error getting documents: \(String(describing: error))")
                return
            }

            for document in querySnapshot!.documents {
                print("\(document.documentID) => \(document.data())")
            }
        }
    }

    //MARK : Actions

    @IBAction private func saveAction(_ sender: UIButton) {
        saveData()
    }

    @IBAction private func getDataAction(_ sender: UIButton) {
        getData()
    }
}
