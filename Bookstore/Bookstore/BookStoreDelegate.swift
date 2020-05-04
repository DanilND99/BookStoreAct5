//
//  BookStoreDelegate.swift
//  Bookstore
//
//  Created by user168028 on 4/24/20.
//  Copyright © 2020 owo. All rights reserved.
//

import Foundation

protocol BookStoreDelegate {
    func newBook(_ controller: AnyObject, newBook: Book)
    func editBook(_ controller: AnyObject, editBook: Book)
    func deleteBook(_ controller: AnyObject)
}
