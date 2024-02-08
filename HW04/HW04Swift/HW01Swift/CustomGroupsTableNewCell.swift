//
//  CustomTableNewCell.swift
//  TestGBProj
//
//  Created by Kirill on 19/01/2024.
//  Copyright © 2024 Kirill. All rights reserved.
//

import UIKit

final class CustomGroupsTableNewCell: UITableViewCell {
    
//    private var label1: UILabel = {
//        let label = UILabel()
//        label.text = "Name"
//        label.textAlignment = .center
//        label.textColor = .black
//        label.backgroundColor = .white
//        return label
//    }()
//
//    private var label2: UILabel = {
//        let label = UILabel()
//        label.text = "Description"
//        label.textAlignment = .center
//        label.textColor = .black
//        label.backgroundColor = .white
//        return label
//    }()
//
//    private var label3: UILabel = {
//        let label = UILabel()
//        label.text = "ТЕкст"
//        label.textAlignment = .center
//        label.textColor = .black
//        label.backgroundColor = .white
//        return label
//    }()
    
//    private var circleView: UIView = {
//       let view = UIView()
//        view.backgroundColor = .white
//        view.layer.cornerRadius = 25
//        return view
//    }()
    
    private var groupAvatar: UIImageView = {
           let view = UIImageView()
           view.backgroundColor = .gray
           view.layer.cornerRadius = 20
           return view
       }()
       
       private var groupName: UILabel = {
           let label = UILabel()
           label.text = "Name"
           label.textAlignment = .left
           label.textColor = .black
           label.backgroundColor = .white
           return label
       }()
       
       private var groupDescription: UILabel = {
           let label = UILabel()
           label.text = "Description"
           label.textAlignment = .left
           label.textColor = .black
           label.backgroundColor = .white
           label.numberOfLines = 5
           return label
       }()
    
    
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        backgroundColor = .clear
//        setupUI()
//        addConstraints()
//       }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    

       override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
           super.init(style: style, reuseIdentifier: reuseIdentifier)
           backgroundColor = .clear // Чтобы ячейка была прозрачной (цвета фона)
           setupUI()
           addConstraints()
       }
       

       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
    
//    func setLabel(labelName: String) {
//        label1.text = labelName
//    }
    
//    private func setupUI() {
//        self.addSubview(label1)
//        self.addSubview(label2)
////        self.addSubview(label3)
//        self.addSubview(circleView)
//    }
    
//    private func addConstraints() {
//
//        label1.translatesAutoresizingMaskIntoConstraints = false
//        label2.translatesAutoresizingMaskIntoConstraints = false
////        label3.translatesAutoresizingMaskIntoConstraints = false
//        circleView.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//
////            circleView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
//            circleView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
//            circleView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
//            circleView.heightAnchor.constraint(equalToConstant: 50),
//            circleView.widthAnchor.constraint(equalTo: circleView.heightAnchor),
//
//
//            label1.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
//            label1.leftAnchor.constraint(equalTo: circleView.rightAnchor, constant: 30),
//            label1.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
////            label1.heightAnchor.constraint(equalToConstant: 20),
//
//            label2.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 10),
//            label2.leftAnchor.constraint(equalTo: label1.leftAnchor),
//            label2.rightAnchor.constraint(equalTo: label1.rightAnchor),
////
////            label3.topAnchor.constraint(equalTo: label2.bottomAnchor, constant: 10),
////            label3.leftAnchor.constraint(equalTo: label1.leftAnchor),
////            label3.rightAnchor.constraint(equalTo: label1.rightAnchor),
////            label3.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
//        ])
//    }
  
    func updateCell(group: Group) {
        
        groupName.text = group.name
        groupDescription.text = group.description
        
        
        DispatchQueue.global().async {
            
            if let url = URL(string: group.photo), let image = try? Data(contentsOf: url) {
                
                DispatchQueue.main.async {
                    self.groupAvatar.image = UIImage(data: image)
                }
            }
        }
    }
    
    private func setupUI() {
        
        contentView.addSubview(groupAvatar)
        contentView.addSubview(groupName)
        contentView.addSubview(groupDescription)
    }
    
    private func addConstraints() {
        
        groupAvatar.translatesAutoresizingMaskIntoConstraints = false
        groupName.translatesAutoresizingMaskIntoConstraints = false
        groupDescription.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            groupAvatar.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            groupAvatar.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            groupAvatar.heightAnchor.constraint(equalToConstant: 40),
            groupAvatar.widthAnchor.constraint(equalTo: groupAvatar.heightAnchor),
            
            groupName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            groupName.leftAnchor.constraint(equalTo: groupAvatar.rightAnchor, constant: 30),
            groupName.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            
            groupDescription.topAnchor.constraint(equalTo: groupName.bottomAnchor, constant: 10),
            groupDescription.leftAnchor.constraint(equalTo: groupName.leftAnchor),
            groupDescription.rightAnchor.constraint(equalTo: groupName.rightAnchor),
            groupDescription.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
}
