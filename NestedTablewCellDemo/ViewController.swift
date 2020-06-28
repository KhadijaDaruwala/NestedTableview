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

    override func viewDidLoad() {
        super.viewDidLoad()
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
        return 6
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReplyCommentsTableViewCell", for: indexPath) as! ReplyCommentsTableViewCell
        return cell
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        //   let view = UIView(frame: CGRect.zero)
        //        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 80))
        //        let label = UILabel(frame: CGRect(x: 5, y: 5, width: view.frame.width - 10,
        //                                          height: view.frame.height - 10))
        //        label.text = "Comments"
        //        label.backgroundColor = .red
        //        view.backgroundColor = UIColor.yellow
        //        view.addSubview(label)
        //        return view

        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "CommentsSectionHeader") as? CommentsSectionHeader
        headerView?.labelCommnets.backgroundColor = .systemPink
        return headerView
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
