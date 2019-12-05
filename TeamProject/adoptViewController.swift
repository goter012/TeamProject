//
//  adoptViewController.swift
//  TeamProject
//
//  Created by sacha kai neptune arthurs on 12/3/19.
//  Copyright © 2019 guillermo j otero jr. All rights reserved.
//

import Foundation

import UIKit
import WebKit

final class adoptViewController: UIViewController, WKNavigationDelegate {
    
    var webView: WKWebView!
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://www.resqmedogmission.org/adoption-application")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
}
