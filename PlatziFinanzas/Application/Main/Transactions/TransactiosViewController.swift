//
//  TransactiosViewController.swift
//  PlatziFinanzas
//
//  Created by Nick Rodriguez Nova on 8/02/21.
//  Copyright © 2021 Platzi. All rights reserved.
//

import UIKit

class TransactiosViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    fileprivate(set) lazy var emptySateView: UIView = {
        guard let view = Bundle.main.loadNibNamed("EmptyState", owner: nil, options: [:])?.first as? UIView else{
        return UIView()
        }
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let cell = UINib(nibName: "TransactionsCell", bundle: Bundle.main)
        tableView.register(cell, forCellReuseIdentifier: "cell")
    
    }

}

extension TransactiosViewController: UITableViewDelegate {
    
}
extension TransactiosViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = 10
        tableView.backgroundView = count == 0 ? emptySateView : nil
        tableView.separatorStyle = count == 0 ? .none : .singleLine
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    }
    
    
}
