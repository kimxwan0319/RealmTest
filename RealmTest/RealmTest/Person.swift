//
//  Person.swift
//  RealmTest
//
//  Created by 김수완 on 2022/01/02.
//

import Foundation
import RealmSwift

// 객체 모델
class Person: Object {

    @objc dynamic var id: Int = 0
    @objc dynamic var old: Int = 0
    @objc dynamic var name: String = ""

    // id를 primaryKey로 지정
    override static func primaryKey() -> String? {
        return "id"
    }

}
