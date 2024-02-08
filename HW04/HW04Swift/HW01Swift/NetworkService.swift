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
    
//    func getFriends(completion: @escaping ([Friend]) -> Void)  {
//
////        guard let url = URL(string:"https://api.vk.com/method/friends.get?&fields=nickname&name&access_token=\(NetworkService.token)&fields=photo_50,online&v=5.199") else {
////            return
////        }
//        guard let url = URL(string: "https://api.vk.com/method/friends.get?access_token=" + NetworkService.token + "&fields=photo_50,online&v=5.131") else {
//                   return
//               }
//
////        print(url)
//
//        session.dataTask(with: url) { (data, _, error) in
//            guard let data = data else {
//                return
//            }
//            do {
//                let friends = try JSONDecoder().decode(Friends.self, from: data)
//                print(friends)
//            } catch {
//                print(error)
//            }
//        }.resume()
//    }
    func getFriends(completion: @escaping ([Friend]) -> Void) {
        
        guard let url = URL(string: "https://api.vk.com/method/friends.get?access_token=" + NetworkService.token + "&fields=photo_50,online&v=5.199") else {
            return
        }
        
        session.dataTask(with: url) { (data, _, networkError) in
            
            guard let data = data else {
                return
            }
            
            do {
                let friends = try JSONDecoder().decode(Friends.self, from: data)
                
                // Выводим в консоль
                //print(friends)
                
                completion(friends.response.items)
                
            } catch {
                print(error)
            }
        }.resume()
    }
    func getGroups(completion: @escaping ([Group]) -> Void) {
//            guard let url = URL(string:"https://api.vk.com/method/groups.get?&access_token=\(NetworkService.token)&v=5.131") else {
//                return
//            }
//            print(url)
        guard let url = URL(string: "https://api.vk.com/method/groups.get?access_token=" + NetworkService.token + "&extended=1&fields=description&v=5.199") else {
                  return
              }
        print(url)
        
            
            session.dataTask(with: url) { (data, _, error) in
                guard let data = data else {
                    return
                }
                do {
                    let groups = try JSONDecoder().decode(Groups.self, from: data)
                    print(groups)
                } catch {
                    print(error)
                }
            }.resume()
        }
    
    func getPhotos(completion: @escaping ([Photo]) -> Void) {
//            guard let url = URL(string:"https://api.vk.com/method/photos.get?fields=bdate&access_token=\(NetworkService.token)&v=5.131&album_id=profile") else {
//                return
//            }
//            print(url)
            
        guard let url = URL(string: "https://api.vk.com/method/photos.get?access_token=" + NetworkService.token + "&album_id=wall&v=5.199") else {
                   return
               }
        
            session.dataTask(with: url) { (data, _, error) in
                guard let data = data else {
                    return
                }
                do {
                    let photos = try JSONDecoder().decode(Photos.self, from: data)
                    print(photos)
                } catch {
                    print(error)
                }
            }.resume()
        }
    
    
}
