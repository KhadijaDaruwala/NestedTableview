//
//  CommentsSectionHeader.swift
//  NestedTablewCellDemo
//
//  Created by Khadija Daruwala on 28/06/20.
//  Copyright © 2020 Khadija Daruwala. All rights reserved.
//

import UIKit

class CommentsSectionHeader: UIView {

    @IBOutlet weak var labelCommnets: UILabel!
    @IBOutlet weak var buttonViewReplies: UIButton!
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    static func loadNib() -> CommentsSectionHeader {
        return UINib(nibName: "CommentsSectionHeader", bundle: nil).instantiate(withOwner: nil, options: nil).first as! CommentsSectionHeader
    }

    override func awakeFromNib() {
    }

}
