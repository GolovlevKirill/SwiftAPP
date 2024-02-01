//
//  NetworkService.swift
//  HW01Swift
//
//  Created by Kirill on 31/01/2024.
//  Copyright © 2024 Kirill. All rights reserved.
//

import Foundation

final class NetworkService {
    private let session = URLSession.shared
    
    static var token = ""
    static var userID = ""
    
    func getFriends() {
        guard let url = URL(string:"https://api.vk.com/method/friends.get?&&fields=nickname&name&access_token=\(NetworkService.token)&v=5.131") else {
            return
        }
        print(url)
        
        session.dataTask(with: url) { (data, _, error) in
            guard let data = data else {
                return
            }
            do {
//                let friends = try JSONDecoder().decode(Friends.self, from: data)
//                print(friends)
            } catch {
                print(error)
            }
        }.resume()
    }
    
    func getGroups() {
            guard let url = URL(string:"https://api.vk.com/method/groups.get?&access_token=\(NetworkService.token)&v=5.131") else {
                return
            }
            print(url)
            
            session.dataTask(with: url) { (data, _, error) in
                guard let data = data else {
                    return
                }
                do {
    //                let friends = try JSONDecoder().decode(Groups.self, from: data)
    //                print(friends)
                } catch {
                    print(error)
                }
            }.resume()
        }
    
    func getPhotos() {
            guard let url = URL(string:"https://api.vk.com/method/photos.getAll?&access_token=\(NetworkService.token)&v=5.131") else {
                return
            }
            print(url)
            
            session.dataTask(with: url) { (data, _, error) in
                guard let data = data else {
                    return
                }
                do {
    //                let friends = try JSONDecoder().decode(Photos.self, from: data)
    //                print(friends)
                } catch {
                    print(error)
                }
            }.resume()
        }
    
    
}
