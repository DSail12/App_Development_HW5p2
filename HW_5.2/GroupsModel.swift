//
//  GroupsModel.swift
//  HW_5.2
//
//  Created by Eugene Zvyagin on 13.07.2023.
//

struct GroupsModel: Decodable {
    var response: Groups
}
struct Groups: Decodable {
    var items: [Group]
}

struct Group: Decodable {
    var id: Int
    var name: String?
    var photo: String?
    var description: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case photo = "photo_50"
        case description
    }
}
