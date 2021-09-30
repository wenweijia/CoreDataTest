//
//  StudentDB.swift
//  CoreDataTest
//
//  Created by 文伟佳 on 2021/9/29.
//

import Foundation
import UIKit
import CoreData

struct StudentDB {
    //    创建一个学生身份
    static func createStudent(name: String, sid: String, age: Int, block:()->Void) {
        //获取管理的数据上下文 对象
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        // 插入数据
        let stu = NSEntityDescription.insertNewObject(forEntityName: "Student", into: context) as! Student
        let teacher = NSEntityDescription.insertNewObject(forEntityName: "Teacher", into: context) as! Teacher
        teacher.name = "xiaowen"
        teacher.job = "语文"
        
        stu.name = name
        stu.sid = sid
        stu.age = Int16(age)
        
        stu.teachBy = teacher
        
        if context.hasChanges {
            do {
                // 保存数据
                try context.save()
                print("Insert new stu(\(name)) successful.")
                block()
            } catch {
                print(error)
            }
        }
    }
    
    //    查询所有学生
    static func queryStudents() {
        //获取管理的数据上下文 对象
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        // 查询数据
        let fetchStudents = NSFetchRequest<Student>.init(entityName: "Student")
    
        do {
            let Students = try context.fetch(fetchStudents)
            print("Students count = \(Students.count)")
            for student in Students {
                print("student name = \(student.name!)")
            }
            print("query students successful.")
        } catch {
            
        }
    }
    
    //    查询学生通过名字
    static func queryStudentWithName(_ name: String ) {
        //获取管理的数据上下文 对象
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        // 查询数据
        let fetchStudents = NSFetchRequest<Student>.init(entityName: "Student")
        // 条件查询
        fetchStudents.predicate = NSPredicate(format: "name = \"\(name)\"")

        do {
            let students = try context.fetch(fetchStudents)
            print("students count = \(students.count)")
            for student in students {
                print("student name = \(student.name!)")
            }
            print("query student:\(name) successful.")
        } catch {
            
        }
    }
    
    //    修改一个学生的名字 读取→修改→保存
    static func updateStudentWithName(_ name: String, newName: String) {
        //获取管理的数据上下文 对象
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        // 查询数据
        let fetchStudents = NSFetchRequest<Student>.init(entityName: "Student")
        // 条件查询
        fetchStudents.predicate = NSPredicate(format: "name = \"\(name)\"")
        
        do {
            let students = try context.fetch(fetchStudents)
            if !students.isEmpty {
                students[0].name = newName
                if context.hasChanges {
                    do {
                        // 保存数据
                        try context.save()
                        print("Update new Student successful.")
                    } catch {
                        print(error)
                    }
                }
            }
        } catch {
            
        }
    }
    
    //    删除一个学生通过名字 读取→删除→保存
    static func deleteStudentWithName(_ name: String) {
        //获取管理的数据上下文 对象
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        // 查询数据
        let fetchStudents = NSFetchRequest<Student>.init(entityName: "Student")
        // 条件查询
        fetchStudents.predicate = NSPredicate(format: "name = \"\(name)\"")
        
        do {
            let students = try context.fetch(fetchStudents)
            if !students.isEmpty {
                context.delete(students[0])
                if context.hasChanges {
                    do {
                        // 保存数据
                        try context.save()
                        print("delete \(name) successful.")
                    } catch {
                        print(error)
                    }
                }
            }
        } catch {
            
        }
    }
    
    //    删除所有学生
    static func deleteAllStudents() {
        //获取管理的数据上下文 对象
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        // 查询数据
        let fetchStudents = NSFetchRequest<Student>.init(entityName: "Student")
        
        do {
            let students = try context.fetch(fetchStudents)
            if !students.isEmpty {
                for stu in students{
                    //删除对象
                    context.delete(stu)
                }
               if context.hasChanges {
                    do {
                        // 保存数据
                        try context.save()
                        print("delete all successful.")
                    } catch {
                        print(error)
                    }
                }
            }
        } catch {
            
        }
    }
}
