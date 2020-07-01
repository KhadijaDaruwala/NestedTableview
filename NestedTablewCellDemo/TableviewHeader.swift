//
//  TableviewHeader.swift
//  NestedTablewCellDemo
//
//  Created by Khadija Daruwala on 28/06/20.
//  Copyright © 2020 Khadija Daruwala. All rights reserved.
//

import UIKit

class TableviewHeader: UIView {

    static func loadNib() -> TableviewHeader {
        return UINib(nibName: "TableviewHeader", bundle: nil).instantiate(withOwner: nil, options: nil).first as! TableviewHeader
    }
}
