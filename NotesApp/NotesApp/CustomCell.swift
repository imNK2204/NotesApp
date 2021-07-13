//
//  CustomCellTableViewCell.swift
//  NotesApp
//
//  Created by srk on 04/07/21.
//  Copyright © 2021 Nikunj. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    
    lazy var backView: UIView = {
        let view = UIView(frame: CGRect(x: 10, y: 20, width: self.frame.width - 20, height: self.frame.height))
//        view.backgroundColor = #colorLiteral(red: 0.9660210409, green: 0.9660210409, blue: 0.9660210409, alpha: 1)
        return view
    }()
    
    lazy var noteLabel: UILabel = {
        let lbl = UILabel(frame: CGRect(x: 20, y: 20, width: backView.frame.width - 116, height: 25))
        lbl.font = UIFont.boldSystemFont(ofSize: 24)
        lbl.textAlignment = .left
        lbl.numberOfLines = 4
        return lbl
    }()
    
    lazy var subnoteLabel: UILabel = {
        let lbl = UILabel(frame: CGRect(x: 20, y: 50, width: backView.frame.width - 116, height: 20))
        lbl.font = UIFont.systemFont(ofSize: 18)
        lbl.textAlignment = .left
        return lbl
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
//        contentView.backgroundColor = UIColor.clear
//        backgroundColor = UIColor.clear
        backView.layer.cornerRadius = 10
        backView.clipsToBounds = true
//        userImage.layer.cornerRadius = 54
//        userImage.clipsToBounds = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        addSubview(backView)
        backView.addSubview(noteLabel)
        backView.addSubview(subnoteLabel)
        // Configure the view for the selected state
    }
    
}
