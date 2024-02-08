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
    private var model: [Group] = []
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
       view.backgroundColor = .green
        title = "GROUPS"
       
        tableView.register(CustomGroupsTableNewCell.self, forCellReuseIdentifier: "cell")
       
        networkService.getGroups { [weak self] groups in
            
            self?.model = groups

            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomGroupsTableNewCell else {
            return UITableViewCell()
        }
        
        cell.updateCell(group: model[indexPath.row])
        
        return cell
    }
}
