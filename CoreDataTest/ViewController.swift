//
//  ViewController.swift
//  CoreDataTest
//
//  Created by 文伟佳 on 2021/9/29.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        StudentDB.deleteAllStudents()
        
        StudentDB.createStudent(name: "小明", sid: "13", age: 15) {
            StudentDB.queryStudents()
        }
//        StudentDB.createStudent(name: "小红", sid: "26", age: 16)
//
//        StudentDB.updateStudentWithName("小明", newName: "张三")
//        StudentDB.queryStudentWithName("张三")
//        StudentDB.deleteStudentWithName("张三")
        
//        StudentDB.queryStudents()

        // Do any additional setup after loading the view.
    }


}

