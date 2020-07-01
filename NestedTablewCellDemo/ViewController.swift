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

    var commentsObjArray: [CommetnObject] = [CommetnObject]()
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

        for i in 0...commentsArray.count-1{
            commentsObjArray.append(CommetnObject(commetn: commentsArray[i]))
        }

        tableview.tableHeaderView = TableviewHeader.loadNib()
        tableview.tableHeaderView?.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 100)
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(UINib(nibName: "ReplyCommentsTableViewCell", bundle: nil),
                           forCellReuseIdentifier: "ReplyCommentsTableViewCell")
        tableview.sectionHeaderHeight = UITableView.automaticDimension
        tableview.estimatedSectionHeaderHeight = 50
    }

    @objc func viewRepliesClicked(_ sender: AnyObject){
        let section = sender.tag ?? 0
        commentsObjArray[section].isExpanded = !commentsObjArray[section].isExpanded
        self.tableview.reloadData()
        if commentsObjArray[section].isExpanded {
            let indexPath = IndexPath(row: 0, section: section)
            tableview.scrollToRow(at: indexPath, at: .middle, animated: false)
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return commentsObjArray.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let replies = commentsObjArray[section].replies {
            if commentsObjArray[section].isExpanded{
                return replies.count
            }
        }
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReplyCommentsTableViewCell", for: indexPath) as! ReplyCommentsTableViewCell

        if let replies = commentsObjArray[indexPath.section].replies{
            cell.labelReply.text = replies[indexPath.row]
        }
        return cell
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        let header = CommentsSectionHeader.loadNib()
        if let comments = commentsObjArray[section].comment{
            header.labelCommnets.text = comments
            header.buttonViewReplies.tag = section
            header.buttonViewReplies.addTarget(self, action: #selector(viewRepliesClicked(_:)), for: .touchUpInside)
        }
        return header
    }
}
