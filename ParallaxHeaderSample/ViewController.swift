//
//  ViewController.swift
//  ParallaxHeaderSample
//
//  Created by 村田真矢 on 2020/05/16.
//  Copyright © 2020 村田真矢. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // カバー画像の通常時の高さ。今回のアスペクトは3:1のため3で割っている
    private var defaultCoverImageHeight: CGFloat { return self.view.frame.width / 3 }
    
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            self.tableView.contentInsetAdjustmentBehavior = .never
        }
    }
    
    @IBOutlet private var coverImageHeightConstraint: NSLayoutConstraint!
    @IBOutlet private var coverImageTopConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.coverImageHeightConstraint.constant = self.defaultCoverImageHeight
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = indexPath.description
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.coverImageHeightConstraint.constant = max(self.defaultCoverImageHeight, -(scrollView.contentOffset.y - self.defaultCoverImageHeight))
        self.coverImageTopConstraint.constant = min(0, -scrollView.contentOffset.y)
    }
}
