//
//  SearchBarViewController.swift
//  AppCheckInByQRCode
//
//  Created by Hoang Trong Kien on 7/6/20.
//  Copyright © 2020 Hoang Trong Kien. All rights reserved.
//

import UIKit

class SearchBarViewController: UIViewController {
  
  @IBOutlet weak var searchBar: UISearchBar!
  override func viewDidLoad() {
    super.viewDidLoad()
    
    searchBar.becomeFirstResponder()
    searchBar.layer.borderWidth = CGFloat(2)
  }
  
  
  @IBAction func backButtonTapped(_ sender: Any) {
    self.dismiss(animated: true, completion: nil)
  }
}

