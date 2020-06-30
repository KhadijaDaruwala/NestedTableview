//
//  ViewController.swift
//  NestedTablewCellDemo
//
//  Created by Khadija Daruwala on 28/06/20.
//  Copyright © 2020 Khadija Daruwala. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!

    var commentsArray = [
        [
            "comment": "This is my first comment",
            "replies": [
                "I agree",
                "This is so true"
            ]
        ],
        [
            "comment": "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ",
            "replies": [
                "What is Lorem Ipsum?",
                "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. T"
            ]
        ],
        [
            "comment": "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.",
            "replies": [
                "Correct"
            ]
        ],
        [
            "comment": "The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested.",
            "replies": [
                "Sections 1.10.32 and 1.10.33 from deFinibusBonorumetMalorum by Cicero are also reproduced in their exact original form",
                "accompanied by English versions from the 1914 translation by H. Rackham.",
                "The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc."
            ]
        ],
        [
            "comment": "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.",
            "replies": [
                "Correct",
                "This is correct",
                "Very tru",
                "Amazing"
            ]
        ]
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        //        let view = UINib(nibName: "TableviewHeader", bundle: .main).instantiate(withOwner: nil, options: nil).first as! TableviewHeader
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(UINib(nibName: "ReplyCommentsTableViewCell", bundle: nil),
                           forCellReuseIdentifier: "ReplyCommentsTableViewCell")
        tableview.sectionHeaderHeight = UITableView.automaticDimension
        tableview.estimatedSectionHeaderHeight = 50

    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return commentsArray.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReplyCommentsTableViewCell", for: indexPath) as! ReplyCommentsTableViewCell
        return cell
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        let header = CommentsSectionHeader.loadNib()
        header.labelCommnets.backgroundColor = UIColor.blue
        return header
    }
}
