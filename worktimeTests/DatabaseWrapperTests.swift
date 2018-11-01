//
//  DatabaseWrapper.swift
//  worktimeTests
//
//  Created by Denis Nascimento on 01/11/18.
//  Copyright © 2018 Denis Nascimento. All rights reserved.
//

import XCTest
import SwiftyJSON

@testable import worktime

class DatabaseWrapperTests: XCTestCase {
    
    var uuid = NSUUID().uuidString
    
    override func setUp() {
//        Database.shared.clear()
    }
    
    override func tearDown() {
        
    }
    
    func testShouldBeSaveThisBook() {
        let book = makeaNewBook()
        assert(Database.shared.create(book: book), "Should be save this book" + book.id!)
    }
    
    func testCheckIfBookIsNull(){
        let book = Database.shared.get(id: NSUUID().uuidString)
        XCTAssertNil(book)
    }
    
    func testShouldBeSaveAndCheckIfExistInDatabase(){
        let saved = Database.shared.create(book: makeaNewBook())
        XCTAssertTrue(saved, "should be saved this book")
        
        let book = Database.shared.get(id: NSUUID().uuidString)
        XCTAssertEqual(book?.id, uuid, "should be exist this book in database")
    }
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    private func makeaNewBook()-> Book {
        var book = Book(json: JSON.null)
        book.id = uuid
        book.date = Date().toString(dateFormat: "yyyy-MM-dd'T'HH:mm")
        book.time = Date().toString(dateFormat: "yyyy-MM-dd'T'HH:mm")
        return book
    }
}
