//
//  DetailViewController.swift
//  Bookstore
//
//  Created by Iván Alejandro Bustillos Sánchez on 3/3/20.
//  Copyright © 2020 owo. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    // Properties
    
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!

    @IBOutlet weak var pagesLabel: UILabel!
    @IBOutlet weak var readSwitch: UISwitch!
    @IBOutlet weak var descriptionTextView: UITextView!
    var delegate: BookStoreDelegate? = nil
    var myBook = Book()
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "editDetail"{
            if let vc = segue.destination as? AddViewController{
                vc.delegate = delegate
                vc.editBook = true
                vc.book = myBook
            }
        }
    }
    @IBAction func deleteBookAction(_ sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: "Warning", message: "Delete this book?", preferredStyle: .alert)
        let noAction = UIAlertAction(title: "No", style: .cancel){ (action) in
            print("Cancel")
        }
        alertController.addAction(noAction)
        let yesAction = UIAlertAction(title:"Yes",style: .destructive){ (action) in
            self.delegate?.deleteBook(self)
        }
        alertController.addAction(yesAction)
        present(alertController, animated: true, completion: nil)
    }
    
    func configureView() {
        // Update the user interface for the detail item.
        
        if let detail = detailItem{
            myBook = detail
            titleLabel.text = myBook.title
            authorLabel.text = myBook.author
            descriptionTextView.text = myBook.description
            pagesLabel.text = String(myBook.pages)
            readSwitch.isOn = myBook.readThisBook
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        readSwitch.isEnabled = false
        // Do any additional setup after loading the view.
        configureView()
    }

    var detailItem: Book? {
        didSet {
            // Update the view.
        }
    }


}

