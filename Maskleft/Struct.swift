//
//  Struct.swift
//  Maskleft
//
//  Created by Chang Sophia on 2/15/20.
//  Copyright © 2020 Chang Sophia. All rights reserved.
//

import Foundation
struct Mask: Decodable {
    let id: String
    let pharmacyName: String
    let address: String
    let tel: String
    let adultCount: Int
    let childCount: Int
    let time: Date
    
    enum CodingKeys: String, CodingKey  {
        case id = "醫事機構代碼"
        case name = "醫事機構名稱"
        case address = "醫事機構地址"
        case tel = "醫事機構電話"
        case adultCount = "成人口罩剩餘數"
        case childCount = "兒童口罩剩餘數"
        case time = "來源資料時間"
    }
    init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            id = try container.decode(String.self, forKey: .id)
            pharmacyName = try container.decode(String.self, forKey: .name)
            address = try container.decode(String.self, forKey: .address)
            tel = try container.decode(String.self, forKey: .tel)
            adultCount = Int(try container.decode(String.self, forKey: .adultCount)) ?? 0
            childCount = Int(try container.decode(String.self, forKey: .childCount)) ?? 0
            time = try container.decode(Date.self, forKey: .time)
        }
    }

