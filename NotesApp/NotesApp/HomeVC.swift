//
//  HomeVC.swift
//  NotesApp
//
//  Created by srk on 04/07/21.
//  Copyright © 2021 Nikunj. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    var tableView = UITableView()
    let noteTitle = UILabel()
    let noteSubtitle = UILabel()
    var theUrl = [URL]()
    var models:[(title: String, note: String)] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "NotesApp"
        tableView.frame = self.view.frame
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        tableView.register(CustomCell.self, forCellReuseIdentifier: "cell")
        
//        let docUrl = FileManager.default.urls(for: .desktopDirectory, in: .userDomainMask).first!
//        do{
//            let dirUrl = try FileManager.default.contentsOfDirectory(at: docUrl, includingPropertiesForKeys: nil, options: [])
//            theUrl = dirUrl
//        } catch {
//            print(error)
//        }
        // file manager
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(onClickLogout))
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(), style: .plain, target: self, action: nil)
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addNotes))
    }
    
    @objc func addNotes() {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "new") as? NewNoteVC else {
            return
        }
        vc.title = "New Note"
        vc.completion = { noteTitle, noteSubtitle in
            self.navigationController?.popToRootViewController(animated: true)
            self.models.append((title: noteTitle, note: noteSubtitle))
            self.tableView.reloadData()
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func onClickLogout(){
        UserDefaults.standard.removeObject(forKey: "email")
        let vc = storyboard?.instantiateViewController(withIdentifier: "ViewController")
        let navVC = UINavigationController(rootViewController: vc!)
        let share = UIApplication.shared.delegate as? AppDelegate
        share?.window?.rootViewController = navVC
        share?.window?.makeKeyAndVisible()
    }

}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
        cell.noteLabel.text = models[indexPath.row].title
        cell.subnoteLabel.text = models[indexPath.row].note
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "new") as? NewNoteVC {
            vc.title = "Edit Note"
            vc.tempNoteTitle = models[indexPath.row].title
            vc.tempNoteSubTitle = models[indexPath.row].note
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func getDocumentDirectory() -> URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return path[0]
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let tempdel = models[indexPath.row].title
            tableView.beginUpdates()
            models.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            print(tempdel)
            let fileurl = FileManager.default.urls(for: .desktopDirectory, in: .userDomainMask).first!.appendingPathComponent("\(tempdel).txt")
            print(fileurl.path)
            if FileManager.default.fileExists(atPath: fileurl.path) {
                do {
                    try FileManager.default.removeItem(at: fileurl)
                } catch {
                    print(error)
                }
            }
            tableView.endUpdates()
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
}
