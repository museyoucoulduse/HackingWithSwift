//
//  DetailViewController.swift
//  HWS-07
//
//  Created by Szymon Blaszczynski on 27/05/16.
//  Copyright © 2016 Szymon Blaszczynski. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

    var webView: WKWebView!
    var detailItem: [String: String]!
    
    @IBOutlet weak var detailTitle: UINavigationItem!
    
    override func loadView() {
        webView = WKWebView()
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard detailItem != nil else { return }
        
        if let title = detailItem["title"] {
            detailTitle.title = title
        }
        else {
            detailTitle.title = ""
        }
        
        if let body = detailItem["body"] {
            var html = "<html>"
            html += "<head>"
            html += "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">"
            html += "<style> body { font-size: 150%; } </style>"
            html += "</head>"
            html += "<body>"
            html += "<h1>"
            html += detailTitle.title!
            html += "</h1>"
            html += body
            html += "<p>Sings: \(detailItem["sigs"]!)</p>"
            html += "</body>"
            html += "</html>"
            webView.loadHTMLString(html, baseURL: nil)
        }
    }


}

