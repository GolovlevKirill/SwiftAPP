//
//  GroupModel.swift
//  HW01Swift
//
//  Created by Kirill on 31/01/2024.
//  Copyright © 2024 Kirill. All rights reserved.
//

//import Foundation

struct Groups: Decodable {
    let response: GroupsItems
}

struct GroupsItems: Decodable {
    let items: [Group]
}

struct Group: Decodable {
    let id: Int
    let name: String
    let description: String
    let photo: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case photo = "photo_50"
    }
}


//{
//    "response":{
//        "count":167,
//        "items":
//        [
//        {
//        "id":1256753,
//        "description":"▇ HELLSCREAM ACADEMY ▇\nСамая большая Рок Школа в СНГ!\nИндивидуальные занятия на Студии и по Skype!\n▇ ОТКРЫТЬ МЕНЮ | ИНФОРМАЦИЯ | ЦЕНЫ\nhttps:\/\/vk.com\/@hellscreamacademy-menu\n▇ Еще больше образовательного контента\nhttps:\/\/boosty.to\/leoshellscream\n▇ Оборудование для домашней студии https:\/\/ya.cc\/m\/HIpsyri",
//        
//            "name":"HELLSCREAM ACADEMY",
//            "screen_name":"hellscreamacademy",
//            "is_closed":0,
//            "type":"page",
//        "photo_50":"https:\/\/sun1-23.userapi.com\/s\/v1\/ig2\/oXgH3QVlwWL26RfMdR9ItG53A3NdKbpFIH0sl3MUHjoNejUD_WpUnhn98IaLYMj22HbjECFTKok3cKYC2c9dduX4.jpg?size=50x50&quality=95&crop=338,96,295,295&ava=1","photo_100":"https:\/\/sun1-23.userapi.com\/s\/v1\/ig2\/z6yVDaJYJdHJ6HOhW8LvjCPwwlr7FkIYkqE4SJ9Bv6zcoFMBJ7GfyM8fqAja8pUqIYCqplKIu-LKy_QIdLuXeZ_7.jpg?size=100x100&quality=95&crop=338,96,295,295&ava=1","photo_200":"https:\/\/sun1-23.userapi.com\/s\/v1\/ig2\/fU4OMypunpCa326aLGVBoVUyXg31Xrw2hRYCkL8yNmfPwNcGtOOPbcMLhYycgRV5ltAiPcNkdV7iohtdwVqiDSjc.jpg?size=200x200&quality=95&crop=338,96,295,295&ava=1"
//        
//        }
//        ,{"id":104560153,"description":"Интересное и познавательное о нашей планете и не только. Интересные научные факты, природа, животные, наука и техника. Новые открытия и путешествия. Поднимем ваше настроение и согреем нашим фирменным юмором!","name":"Об интересном","screen_name":"obinteresn0m","is_closed":0,"type":"page","photo_50":"https:\/\/sun1-19.userapi.com\/s\/v1\/if1\/9WO4ehHVQTzRLGcWKsWTisBHZReqQrfnlFFbA5lfgqNr9rQUJdX32kprj7PBy_Eo0BYA2dcD.jpg?size=50x50&quality=96&crop=21,259,508,508&ava=1","photo_100":"https:\/\/sun1-19.userapi.com\/s\/v1\/if1\/hABRCjSGOgqPvn_o9TyjuMTbNmVN1IkwvlLCByD2O1Lpfzidn9rbS6f6H7U3E6a_ZORiKiu0.jpg?size=100x100&quality=96&crop=21,259,508,508&ava=1","photo_200":"https:\/\/sun1-19.userapi.com\/s\/v1\/if1\/h8Uc3a7Tk_V9F3L5e7D7DjBqEH2_mfjGdKNW6QumI41vq7ZBNRQSAXRDYlzZzS-2Qa8Dc5ek.jpg?size=200x200&quality=96&crop=21,259,508,508&ava=1"},{"id":41215610,"description":"Музыкальный продюсер","name":"Sk1nnydave","screen_name":"sk1nnydave","is_closed":0,"type":"page","photo_50":"https:\/\/sun1-16.userapi.com\/s\/v1\/ig2\/YFFvfStJsdkJgJz7TtmRXndX-Yi0ibvHM76pTBvC-ImQULLcQLdC_FxFEXxPWtqubP4hKwb_hWFtMldk5C6w21ms.jpg?size=50x50&quality=95&crop=0,338,400,400&ava=1","photo_100":"https:\/\/sun1-16.userapi.com\/s\/v1\/ig2\/VrsiMGyKtDz83drukmy0mkFF80ZwAknhy0T0tgbep4EgHJz9wZbPrMd3fwAAwevgvEWtP7XVgkF552x-d0W2vNo_.jpg?size=100x100&quality=95&crop=0,338,400,400&ava=1","photo_200":"https:\/\/sun1-16.userapi.com\/s\/v1\/ig2\/YcioB-DEC0b-mdzaw6Pirrt_RJ-OgUtqUWum61-bp8Q13-tDvbp8nA76LWg3lXSSmxgXdZa5qRHzUCmA5RvYfAaW.jpg?size=200x200&quality=95&crop=0,338,400,400&ava=1"},{"id":36959483,"description":"Только самые интересные факты из нашей с вами действительности.\n\nНаша телега : https:\/\/t.me\/etarussia","name":"Эта весёлая Россия","screen_name":"vk.policyhumor","is_closed":0,"type":"page","photo_50":"https:\/\/sun1-28.userapi.com\/s\/v1\/ig2\/sX0QVkDCMPFCLld76sWsiocy1arq262y5ZGc3-uW_dMA_FqWuQaHVXSWsUHoNhuCaY3v-jtmpoB3_5ib2i9GfoQi.jpg?size=50x50&quality=96&crop=89,140,479,479&ava=1","photo_100":"https:\/\/sun1-28.userapi.com\/s\/v1\/ig2\/zi4FeW_2p2ulqtzcmgFFOUv5Hasg-HKGs-BACi0p1KGYF-Fq9qbgS7we87gRJehZqROsbyVvOFwddg96Wqg6O8lG.jpg?size=100x100&quality=96&crop=89,140,479,479&ava=1","photo_200":"https:\/\/sun1-28.userapi.com\/s\/v1\/ig2\/CzhHCuVQhLuVRHn2bjsbFE8v1PrKguQ_3djGu_pXUs5D-oia48G33omq84TqUhOE8s5VwkvBB2ILKSb4nEaUaDfL.jpg?size=200x200&quality=96&crop=89,140,479,479&ava=1"},{"id":97929085,"description":"Твой бот знакомств Анонимный чат ВКонтакте.\n\nВ нашем сообществе работает Анонимный Чат-Бот, созданный для общения через текстовые и голосовые сообщения. Основной его целью является помочь вам найти новых интересных собеседников без раскрытия личной информации.\n\nКонтент, размещаемый в нашем паблике, содержит исключительно юмористический характер и не несёт цели кого-либо оскорбить.","name":"Анонимный Чат","screen_name":"club97929085","is_closed":0,"type":"page","photo_50":"https:\/\/sun1-84.userapi.com\/s\/v1\/ig2\/hl-Wf4yuOy7sgyUgTaxyyuaaR8J-N3p8Yireo3lYx4InSNl0CoRm-skQlfs8RzsXqhwB-DF0ysXR6yWAQrzSBjfO.jpg?size=50x50&quality=95&crop=0,6,828,828&ava=1","photo_100":"https:\/\/sun1-84.userapi.com\/s\/v1\/ig2\/3htZw0P2MerDp37bJ0rtgaUVyYYgXbgQOJUEcOdHJeRZjLJBaHJfU1ilkMY3dU-eunMVQpla2H2GPoZFQ6UcOQgl.jpg?size=100x100&quality=95&crop=0,6,828,828&ava=1","photo_200":"https:\/\/sun1-84.userapi.com\/s\/v1\/ig2\/w5SYacqkW3uIpeENEBF6rQBz_VoRmIPOXhLHawJ5KJSCygUrnZd9UjRnWpuDLyaS7zXW-cH_8pQ1ZL2NQoMEyy2U.jpg?size=200x200&quality=95&crop=0,6,828,828&ava=1"},{"id":26307864,"description":"Отвлекись от суеты и заходи к нам.","name":"Искусство
//
