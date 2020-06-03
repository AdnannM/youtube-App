//
//  ViewController.swift
//  youtube-App
//
//  Created by Adnann Muratovic on 20/05/2020.
//  Copyright © 2020 Adnann Muratovic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	var model = Model()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
		
		model.getVideo()
    }


}

