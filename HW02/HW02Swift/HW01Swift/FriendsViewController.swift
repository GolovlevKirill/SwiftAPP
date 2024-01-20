//
//  FriendViewController.swift
//  HW01Swift
//
//  Created by Kirill on 20/01/2024.
//  Copyright © 2024 Kirill. All rights reserved.
//
import UIKit


final class FriendsViewController: UITableViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .yellow
        title = "FRIENDS"

    }
    
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        0
//    }
//
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let a = CustomFriendsTableNewCell()
        
        a.setLabel(labelName: "NAME")
        return a
    }
    
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        "Section"
//    }
}



