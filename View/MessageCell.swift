//
//  MessageCell.swift
//  ChattingApp
//
//  Created by md asadullah on 03/06/21.
//  Copyright © 2021 droisys. All rights reserved.
//  @shahnawazul added the comment for testing and i am very happy that i am getting to learn github, i would like to dedicate all my success to asad bhai and afsar bhai, i will make everyone proud and now i am getting emotional, i love allah, and allah is my guide, thank ou so much for your kind attention. 

import UIKit

class MessageCell: UITableViewCell {

    @IBOutlet weak var messageBubble: UIView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var rightImageView: UIImageView!
    @IBOutlet weak var leftImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        messageBubble.layer.cornerRadius = messageBubble.frame.height / 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
