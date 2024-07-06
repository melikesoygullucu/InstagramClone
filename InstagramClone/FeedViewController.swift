//
//  FeedViewController.swift
//  InstagramClone
//
//  Created by Melike Soygüllücü on 2.07.2024.
//

import UIKit
import FirebaseFirestore

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var userEmailArray = [String]()
    var commentArray = [String]()
    var likeArray = [Int]()
    var postArray = [String]()
    var imageArray = [String]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        // Do any additional setup after loading the view.
        
        getDataFromFirestore()
    }
    
    func getDataFromFirestore() {
        let firestoreDatabase = Firestore.firestore()
        
        firestoreDatabase.collection("Posts").addSnapshotListener { snaphot, error in
            if error != nil {
                print(error?.localizedDescription)
            } else {
                if snaphot?.isEmpty != true && snaphot != nil {
                    
                    self.userEmailArray.removeAll(keepingCapacity: false)
                    self.commentArray.removeAll(keepingCapacity: false)
                    self.likeArray.removeAll(keepingCapacity: false)
                    self.imageArray.removeAll(keepingCapacity: false)

                    
                    for document in snaphot!.documents {
                        let documentID = document.documentID
                        print(documentID)
                        
                        if let owner = document.get("owner") as? String {
                            self.userEmailArray.append(owner)
                        }
                        
                        if let postComment = document.get("postComment") as? String {
                            self.commentArray.append(postComment)
                        }
                        
                        if let likes = document.get("likes") as? Int {
                            self.likeArray.append(likes)
                        }
                        
                        if let imageURL = document.get("imageURL") as? String {
                            self.imageArray.append(imageURL)
                        }
                        
                    }
                    self.tableView.reloadData()
                }
            }
        }
        
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userEmailArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FeedCell
        cell.userEmailLabel.text = userEmailArray[indexPath.row]
        cell.likeLabel.text = String(likeArray[indexPath.row])
        cell.captionLabel.text = commentArray[indexPath.row]
        cell.postImageView.image = UIImage(named: "select.png")
        return cell
    }
    
    
}
