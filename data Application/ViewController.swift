//
//  ViewController.swift
//  data Application
//
//  Created by Mac on 2020-01-16.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var books : [Book] = []
//    @IBOutlet weak var TitileTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loaddata()
    }
    @IBOutlet var textFileds: [UITextField]!
//    @IBOutlet weak var textfileds: UIStackView!
    func getFieldPath() -> String{
        let documentPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        if documentPath.count > 0 {
            let documentDirectory = documentPath[0]
            let filePtah = documentDirectory.appending("/data.txt")
            return filePtah
        }
        return ""
    }
    func loaddata(){
        let filePath = getFieldPath()
       let books = [Book]()
    }

    @IBAction func addbook(_ sender: UIBarButtonItem) {
        let title = textFileds[0].text ?? ""
        let author = textFileds[0].text ?? ""
        let pages = Int(textFileds[0].text ?? "0") ?? 0
        let year = Int(textFileds[0].text ??  "2019") ?? 2019
let book = Book(title: title, author: author, pages: pages, year: year)
       
        books.append(book)
        for textField in textFileds {
            textField.text = ""
            textField.resignFirstResponder()
        }

        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let BookTable = segue.destination as? BooksTableViewController{
            BookTable.books = self.books
        }
    }
    func   savedata() {
        let filedpath = getFieldPath()
        var saveString = ""
        for book in books{
            saveString = "\(saveString)\(book.title),\(book.author),\(book.pages),\(book.year)\n"
        }
        do {
            try saveString.write(toFile: filedpath, atomically: true, encoding: .utf8)
        }catch{
            print(error)
        }
    }
}



