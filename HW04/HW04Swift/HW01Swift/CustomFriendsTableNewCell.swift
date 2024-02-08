//
//  CustomTableNewCell.swift
//  TestGBProj
//
//  Created by Kirill on 19/01/2024.
//  Copyright © 2024 Лариса. All rights reserved.
//

import UIKit

final class CustomFriendsTableNewCell: UITableViewCell {
    
//    private var label1: UILabel = {
//        let label = UILabel()
//        label.text = "Name"
//        label.textAlignment = .center
//        label.textColor = .black
//        label.backgroundColor = .white
//        return label
//    }()
    
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
    
    

       private var friendAvatar: UIImageView = {
           let view = UIImageView()
           view.backgroundColor = .gray
           view.layer.cornerRadius = 20 // Половина длины стороны
           return view
       }()
       
       private var friendName: UILabel = {
           let label = UILabel()
           label.text = "Name"
           label.textAlignment = .left
           label.textColor = .black
           label.backgroundColor = .white
           return label
       }()
       
       private var friendIsOnline: UIView = {
           let view = UIView()
           view.backgroundColor = .red
           view.layer.cornerRadius = 5 // Половина длины стороны
           return view
       }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        setupUI()
        addConstraints()
       }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    func setLabel(labelName: String) {
//        label1.text = labelName
//    }
    
    

    func updateCell(friend: Friend) {
        
        friendName.text = friend.firstName + " " + friend.lastName
        
        friendIsOnline.backgroundColor = friend.online == 1 ? .green : .red
        

        DispatchQueue.global().async {
            
            if let url = URL(string: friend.photo), let image = try? Data(contentsOf: url) {
                
                DispatchQueue.main.async {
                    self.friendAvatar.image = UIImage(data: image)
                }
            }
        }
    }
    
    
    
    private func setupUI() {
//        self.addSubview(label1)
//        self.addSubview(label2)
//        self.addSubview(label3)
//        self.addSubview(circleView)
        contentView.addSubview(friendAvatar)
        contentView.addSubview(friendName)
        contentView.addSubview(friendIsOnline)
    }
    
    private func addConstraints() {
        
//        label1.translatesAutoresizingMaskIntoConstraints = false
//        label2.translatesAutoresizingMaskIntoConstraints = false
//        label3.translatesAutoresizingMaskIntoConstraints = false
//        circleView.translatesAutoresizingMaskIntoConstraints = false
        
        
        friendAvatar.translatesAutoresizingMaskIntoConstraints = false
        friendName.translatesAutoresizingMaskIntoConstraints = false
        friendIsOnline.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
         
//            circleView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
//            circleView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
//            circleView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
//            circleView.heightAnchor.constraint(equalToConstant: 50),
//            circleView.widthAnchor.constraint(equalTo: circleView.heightAnchor),
            
            
//            label1.centerYAnchor.constraint(equalTo: circleView.centerYAnchor),
//            label1.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
//            label1.leftAnchor.constraint(equalTo: circleView.rightAnchor, constant: 30),
//            label1.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
//            label1.heightAnchor.constraint(equalToConstant: 20),
//            
//            label2.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 10),
//            label2.leftAnchor.constraint(equalTo: label1.leftAnchor),
//            label2.rightAnchor.constraint(equalTo: label1.rightAnchor),
//
//            label3.topAnchor.constraint(equalTo: label2.bottomAnchor, constant: 10),
//            label3.leftAnchor.constraint(equalTo: label1.leftAnchor),
//            label3.rightAnchor.constraint(equalTo: label1.rightAnchor),
//            label3.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            
            
            friendAvatar.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            friendAvatar.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            friendAvatar.heightAnchor.constraint(equalToConstant: 40),
            friendAvatar.widthAnchor.constraint(equalTo: friendAvatar.heightAnchor),
            
            friendName.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            friendName.leftAnchor.constraint(equalTo: friendAvatar.rightAnchor, constant: 30),
            friendName.rightAnchor.constraint(equalTo: friendIsOnline.leftAnchor, constant: -10),
            
            friendIsOnline.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            friendIsOnline.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            friendIsOnline.heightAnchor.constraint(equalToConstant: 10),
            friendIsOnline.widthAnchor.constraint(equalTo: friendIsOnline.heightAnchor),
        ])
    }
    
}
