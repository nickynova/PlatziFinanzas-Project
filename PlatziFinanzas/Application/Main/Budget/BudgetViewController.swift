//
//  BudgetViewController.swift
//  PlatziFinanzas
//
//  Created by Nick Rodriguez Nova on 10/02/21.
//  Copyright © 2021 Platzi. All rights reserved.
//

import UIKit

class BudgetViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var animatinsButtons: [UIButton]!
    @IBOutlet weak var animationLayout: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let cell = UINib(nibName: "TransactionsCell", bundle: Bundle.main)
        tableView.register(cell, forCellReuseIdentifier: "cell")
    }
    
    @IBAction func animateHeader(sender: UIButton) {
        animationLayout.constant =  sender.frame.origin.x
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        } completion: { (completed) in
            self.animatinsButtons.forEach { $0.setTitleColor(UIColor(named: "textColor"), for: .normal)
                sender.setTitleColor(UIColor.white, for: .normal)
            }
        }
    }
}

extension BudgetViewController: UITableViewDelegate {
    
}
extension BudgetViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = 10
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    }
    
    
}
