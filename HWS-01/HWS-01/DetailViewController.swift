//
//  DetailViewController.swift
//  HWS-01
//
//  Created by Szymon Blaszczynski on 26/05/16.
//  Copyright © 2016 Szymon Blaszczynski. All rights reserved.
//

import UIKit
import Social

class DetailViewController: UIViewController {
    
    @IBOutlet weak var detailImageView: UIImageView!

    var detailItem: String? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = self.detailItem {
            if let imageView = self.detailImageView {
                imageView.image = UIImage(named: detail)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .Action, target: self,
            action: #selector(shareTapped))

    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
        if let title = detailItem {
            self.title = title
        }
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    func shareTapped() {
        let vc = UIActivityViewController(activityItems: [detailImageView.image!], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        presentViewController(vc, animated: true, completion: nil)
//        let vc = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
//        vc.setInitialText("Look at this great picture!")
//        vc.addImage(detailImageView.image!)
//        vc.addURL(NSURL(string: "http://www.photolib.noaa.gov/nssl"))
//        presentViewController(vc, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

