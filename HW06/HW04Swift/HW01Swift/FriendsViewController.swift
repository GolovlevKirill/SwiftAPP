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
            
    private var coreDataService = CoreDataService()
    
    private var model: [Friend] = []
        
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.backgroundColor = Theme.currentTheme.backgroundColor
        tableView.backgroundColor = Theme.currentTheme.backgroundColor
        
        title = "Friends"
        
        
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.barTintColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "person"),
            style: .plain,
            target: self,
            action: #selector(tap)
        )
        
        
        model = coreDataService.getFriends()
        tableView.reloadData()
        
        
        tableView.register(CustomFriendsTableNewCell.self, forCellReuseIdentifier: "cell")
        
        

        
        getFriends()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = Theme.currentTheme.backgroundColor
        tableView.backgroundColor = Theme.currentTheme.backgroundColor
        tableView.reloadData()
    }
    
    func getFriends() {
        
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(update), for: .valueChanged)
  
        networkService.getFriends { [weak self] result in
            
            switch result {
                
            case .success(let friends):
                
                self?.model = friends
                self?.coreDataService.saveFriends(friends: friends)
                
                DispatchQueue.main.async {
                    
                    self?.tableView.reloadData()
                }
                
            case .failure(_):
                self?.model = self?.coreDataService.getFriends() ?? []
                DispatchQueue.main.async {
                    self?.showAlert()
                }
            }
        }
    }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //5
        model.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
   
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomFriendsTableNewCell else {
            return UITableViewCell()
        }
        
        cell.updateCell(friend: model[indexPath.row])
        
        cell.tap = { [weak self] text, photo in
            self?.navigationController?.pushViewController(ProfileViewController(name: text, photo: photo, isUserProfile: false), animated: true)
        }
        
        return cell
    }
}


private extension FriendsViewController {
    
    func showAlert() {
        
        let date = DateHelper.getDate(date: coreDataService.getFriendsDate())
        let alert = UIAlertController(
            title: "Не удалось получить данные",
            message: "Данные актуальны на \(date)",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "Закрыть", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

private extension FriendsViewController {
    
    @objc func tap() {
        
        
        let animation = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name: .easeOut)
        animation.type = .moveIn
        animation.duration = 1
        
        
        navigationController?.view.layer.add(animation, forKey: nil)
        
        
        navigationController?.pushViewController(ProfileViewController(isUserProfile: true), animated: false)
    }
    
    @objc func update() {
        
        networkService.getFriends { [weak self] result in
            
            
            
            switch result {
                
            case .success(let friends):
                
                self?.model = friends
                self?.coreDataService.saveFriends(friends: friends)
                
                
                DispatchQueue.main.async {
                    
                    
                    self?.tableView.reloadData()
                }
                
            case .failure(_):
                self?.model = self?.coreDataService.getFriends() ?? []
                DispatchQueue.main.async {
                    self?.showAlert()
                }
            }
            
            
            DispatchQueue.main.async {
                self?.refreshControl?.endRefreshing()
            }
        }
    }
}


