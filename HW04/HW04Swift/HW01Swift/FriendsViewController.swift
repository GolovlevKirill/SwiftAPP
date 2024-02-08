//
//  FriendViewController.swift
//  HW01Swift
//
//  Created by Kirill on 20/01/2024.
//  Copyright © 2024 Kirill. All rights reserved.
//
import UIKit


final class FriendsViewController: UITableViewController {
    
    private let networkService = NetworkService()
    private var model: [Friend] = []
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .yellow
        title = "FRIENDS"
        
        tableView.register(CustomFriendsTableNewCell.self, forCellReuseIdentifier: "cell")
        
        networkService.getFriends { [weak self] friends in
            
            self?.model = friends
            

            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        model.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomFriendsTableNewCell else {
                   return UITableViewCell()
               }
               
               cell.updateCell(friend: model[indexPath.row])
               
               return cell
        
    }
 
}



