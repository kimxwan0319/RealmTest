//
//  ViewController.swift
//  RealmTest
//
//  Created by 김수완 on 2022/01/02.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    // Realm 가져오기
    let realm = try! Realm()

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var oldTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Realm 파일 위치
        print(Realm.Configuration.defaultConfiguration.fileURL!)

    }

    // MARK: C
    @IBAction func registerButton(_ sender: Any) {

        // 저장할 객체 생성
        let person = Person()
        person.id = Int(idTextField.text ?? "0")!
        person.old = Int(oldTextField.text ?? "0")!
        person.name = nameTextField.text ?? ""

        // Realm에 객체 저장
        try! realm.write {
            realm.add(person)
        }

    }

    // MARK: R
    @IBAction func printButton(_ sender: Any) {

        // `Person`으로 저장된 객체들 불러오기
        let savedPerson = realm.objects(Person.self)

        print(savedPerson)

    }

    // MARK: U
    @IBAction func oldModifyButton(_ sender: Any) {
        let id = idTextField.text!
        if id != "" {
            
            // `Person`으로 저장된 객체들 중 특정 id값 객체 필터링
            let specificPerson = realm.objects(Person.self).filter("id == \(id)")

            // 특정 객체 수정
            try! realm.write {
                specificPerson.first?.old = Int(oldTextField.text ?? "0")!
            }

        }
    }
    @IBAction func nameModifyButton(_ sender: Any) {
        let id = idTextField.text!
        if id != "" {
            
            // `Person`으로 저장된 객체들 중 특정 id값 객체 필터링
            let specificPerson = realm.objects(Person.self).filter("id == \(id)")

            // 특정 객체 수정
            try! realm.write {
                specificPerson.first?.name = nameTextField.text ?? ""
            }

        }
    }

    // MARK: D
    @IBAction func deleteButton(_ sender: Any) {
        let id = idTextField.text!
        if id != "" {
            
            // `Person`으로 저장된 객체들 중 특정 id값 객체 필터링
            let specificPerson = realm.objects(Person.self).filter("id == \(id)")

            // 특정 객체 삭제
            try! realm.write {
                realm.delete(specificPerson)
            }

        } else {

            // 모든 객체 삭제
            try! realm.write {
                realm.deleteAll()
            }

        }
    }
    
}

