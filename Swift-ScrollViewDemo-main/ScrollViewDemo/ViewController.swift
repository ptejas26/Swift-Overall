//
//  ViewController.swift
//  SCrollViewDemo
//
//  Created by Tejas on 2023-11-06.
//

import UIKit

class ViewController: UIViewController {

    fileprivate weak var backButton: UIBarButtonItem!

    @IBOutlet weak var scrollView1: UIScrollView!

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Second VC"
        scrollView1.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView1.contentOffset.y > 50 {
            self.navigationController?.navigationBar.backItem?.backButtonTitle = ""
        } else {
            self.navigationController?.navigationBar.backItem?.backButtonTitle = "Women+"
        }
    }
}

