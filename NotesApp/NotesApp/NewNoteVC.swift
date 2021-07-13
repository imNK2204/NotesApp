//
//  NewNoteVC.swift
//  NotesApp
//
//  Created by srk on 04/07/21.
//  Copyright © 2021 Nikunj. All rights reserved.
//

import UIKit

class NewNoteVC: UIViewController {
    
    @IBOutlet var noteTitleTextField: UITextField!
    @IBOutlet var noteSubTitleTextView: UITextView!
    
    var tempNoteTitle = ""
    var tempNoteSubTitle = ""
    
    public var completion: ((String, String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        noteTitleTextField.text = tempNoteTitle
        noteSubTitleTextView.text = tempNoteSubTitle
        noteTitleTextField.becomeFirstResponder()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(didTapeSave))
    }
    
    func getDocumentDirectory() -> URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return path[0]
    }
    
    @objc func didTapeSave(){
        if let text = noteTitleTextField.text, !text.isEmpty,
            !noteSubTitleTextView.text.isEmpty {
            completion?(text, noteSubTitleTextView.text)
            let url = self.getDocumentDirectory().appendingPathComponent("\(text).txt")
            let data = noteSubTitleTextView.text
            do {
                try data?.write(to: url, atomically: true, encoding: .utf8)
                print(url.path)
            } catch {
                print(error)
            }
        }
    }

}
