//
//  ViewController.swift
//  ArticleNews
//
//  Created by Arilson Silva on 01/08/25.
//

import UIKit

class ViewController: UIViewController {
    
    private let articleNewsView = ArticleNewsView()
    
    override func loadView() {
        self.view = articleNewsView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
