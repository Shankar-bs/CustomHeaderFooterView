//
//  ViewController.swift
//  CustomHeaderView
//
//  Created by Shankar B S on 14/06/20.
//  Copyright © 2020 Slicode. All rights reserved.
//

import UIKit

struct Constants {
    static let stdCornerRadius: CGFloat = 12.0
}

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        registerViewsToTableView()
    }
    
    private func registerViewsToTableView() {
        tableView.register(UINib(nibName: "CustomTableCell", bundle: nil), forCellReuseIdentifier:CustomTableCell.ReuseID())
        tableView.register(UINib(nibName: "CustomHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: CustomHeaderView.ReuseID())
        tableView.register(UINib(nibName: "CustomFooterView", bundle: nil), forHeaderFooterViewReuseIdentifier: CustomFooterView.ReuseID())
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Int.random(in: 3...5)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableCell.ReuseID())
        guard let customCell = cell as? CustomTableCell else { return UITableViewCell() }
        return customCell
    }
    
    //MARK: Section View Handling
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: CustomHeaderView.ReuseID()) as? CustomHeaderView  else { return nil }
        return headerView
    }
       
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        guard let footerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: CustomFooterView.ReuseID()) as? CustomFooterView  else { return nil }
        //Make sure to set delegate
        footerView.delegate = self
        footerView.footerSection = section
        return footerView
    }
       
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50.0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 50.0
    }
}

extension ViewController: FooterViewDelegate {
    func viewMoreButtonTappedInFooter(view: CustomFooterView, inSection section: Int) {
        //Handle Action
        print("Handle Action for footer in section:\(section)")
    }
}
