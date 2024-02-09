//
//  GroupsViewController.swift
//  HW01Swift
//
//  Created by Kirill on 20/01/2024.
//  Copyright © 2024 Kirill. All rights reserved.
//



//final class GroupsViewController: UITableViewController {
//    private let networkService = NetworkService()
//        private var model: [Group] = []
//
//
//    override func viewDidLoad() {
//
//        super.viewDidLoad()
//        view.backgroundColor = .green
//        title = "GROUPS"
//
//        // Для возможности переиспользовать ячейки
//        tableView.register(CustomGroupsTableNewCell.self, forCellReuseIdentifier: "cell")
//
////        networkService.getGroups()
//        networkService.getGroups { [weak self] groups in
//
//            self?.model = groups
//
//            // Поскольку при запросе к другому серверу система переключается на другую очередь, то вручную переводим на основную очередь.
//            DispatchQueue.main.async {
//
//                // Перезагружаем таблицу
//                self?.tableView.reloadData()
//            }
//        }
//
//    }
//
////    override func numberOfSections(in tableView: UITableView) -> Int {
////        0
////    }
////
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
////        5
//        model.count
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
////        let a = CustomGroupsTableNewCell()
////        return a
//
//        // Проверяем, а точно ли ячейка, полученная через dequeueReusableCell, имеет нужный нам тип - GroupCell.
//               guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? GroupCell else {
//                   return UITableViewCell()
//               }
//
//               cell.updateCell(group: model[indexPath.row])
//
//               return cell
//    }
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        70
//    }
//
////    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
////        "Section"
////    }
//}

import UIKit

final class GroupsViewController: UITableViewController {

    private let networkService = NetworkService()
    
    private var coreDataService = CoreDataService()

    
    private var model: [Group] = []
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.backgroundColor = Theme.currentTheme.backgroundColor
        tableView.backgroundColor = Theme.currentTheme.backgroundColor
        
        title = "Groups"
        
        
        tableView.register(GroupsCellView.self, forCellReuseIdentifier: "cell")
        
        

        
        getGroups()
    }
    
    func getGroups() {
        
        networkService.getGroups { [weak self] result in

            switch result {
                
            case .success(let groups):
                
                self?.model = groups
                self?.coreDataService.saveGroups(groups: groups)
                
                
                DispatchQueue.main.async {
                    
                    self?.tableView.reloadData()
                }
                
            case .failure(_):
                self?.model = self?.coreDataService.getGroups() ?? []
                DispatchQueue.main.async {
                    self?.showAlert()
                }
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = Theme.currentTheme.backgroundColor
        tableView.backgroundColor = Theme.currentTheme.backgroundColor
        tableView.reloadData()
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //5
        model.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? GroupsCellView else {
            return UITableViewCell()
        }
        
        cell.updateCell(group: model[indexPath.row])
        
        return cell
    }
}


private extension GroupsViewController {
    
    func showAlert() {
        
        let date = DateHelper.getDate(date: coreDataService.getGroupsDate())
        let alert = UIAlertController(
            title: "Не удалось получить данные",
            message: "Данные актуальны на \(date)",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "Закрыть", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
