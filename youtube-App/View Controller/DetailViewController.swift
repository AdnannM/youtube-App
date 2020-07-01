//
//  DetailViewController.swift
//  youtube-App
//
//  Created by Adnann Muratovic on 01/07/2020.
//  Copyright © 2020 Adnann Muratovic. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
	
	// MARK: Properties
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var dateLabel: UILabel!
	@IBOutlet weak var webView: WKWebView!
	@IBOutlet weak var textView: UITextView!
	
	var video: Video?
	
	override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
	
	override func viewWillAppear(_ animated: Bool) {
		
		// Clear the fields
		titleLabel.text = ""
		dateLabel.text = ""
		textView.text = ""
		
		// Check if there's a video
		guard video != nil else { return }
		
		// Create embed URL
		let ebmedURL = Constants.yT_Embeded_URL + video!.videoId
		
		// Load in into the WebView
		let url = URL(string: ebmedURL)
		let request = URLRequest(url: url!)
		webView.load(request)
		
		// Set the Title
		titleLabel.text = video!.title
		
		// Set the Date
		let df = DateFormatter()
		df.dateFormat = "EEEE, MMM d, yyyy"
		dateLabel.text = df.string(from: video!.published)
		
		// Set the Description
		textView.text = video!.description
		
	}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
