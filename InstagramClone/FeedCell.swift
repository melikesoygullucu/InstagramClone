//
//  FeedCell.swift
//  InstagramClone
//
//  Created by Melike Soygüllücü on 5.07.2024.
//

import UIKit
import FirebaseFirestore

class FeedCell: UITableViewCell {

    @IBOutlet weak var userEmailLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var documentIDLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func likeButton(_ sender: Any) {
        let firestoreDatabase = Firestore.firestore()
        
        if let likeCount = Int(likeLabel.text!) {
            let likeStore = ["likes" : likeCount + 1] as [String : Any]
            
            firestoreDatabase.collection("Posts").document(documentIDLabel.text!).setData(likeStore, merge: true)
        }
    }
    
}
