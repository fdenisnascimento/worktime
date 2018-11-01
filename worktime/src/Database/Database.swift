//
//  DatabaseWrapper.swift
//  worktime
//
//  Created by Denis Nascimento on 01/11/18.
//  Copyright © 2018 Denis Nascimento. All rights reserved.
//

import Foundation
import SwiftyJSON

let DATABASE_NAME = "data_base_books"

protocol DatabaseProtocol {
    func create(book: Book) -> Bool
    func get(id: String) -> Book?
    func delete(id: Int) -> Bool
    func clear()
}

class Database: DatabaseProtocol {
    
    static let database = UserDefaults.standard
    
    static let shared = Database()
    
    func create(book: Book) -> Bool {
        let books = getAllBooks()
        books.add(book.dictionaryRepresentation())
        return save(books: books)
    }
    
    func get(id: String) -> Book? {
        var result: Book?
        getAllBooks().forEach { (book) in
            let ok = Book(object: book)
            if ok.id == id {
                result = ok
            }
        }
        return result
    }
    
    func delete(id: Int) -> Bool {
        return false
    }
    
    func clear() {
        Database.database.removeObject(forKey: DATABASE_NAME)
    }
    
    private func save(books: NSMutableArray) -> Bool {
        Database.database.set(books, forKey: DATABASE_NAME)
        return Database.database.synchronize()
    }
    
    private func getAllBooks() -> NSMutableArray {
        if let books = Database.database.object(forKey: DATABASE_NAME) {
            return books as! NSMutableArray
        }
        return NSMutableArray()
    }
    
}
