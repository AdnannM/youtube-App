//
//  ViewController.swift
//  youtube-App
//
//  Created by Adnann Muratovic on 20/05/2020.
//  Copyright © 2020 Adnann Muratovic. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ModelDelegate {

	
	@IBOutlet weak var tableView: UITableView!
	
	var model = Model()
    var video = [Video]()
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		// Set self as deta source and delegate
		tableView.dataSource = self
		tableView.delegate = self
	
		// set itself as the delegate of the model
		model.delgate = self
		
		model.getVideo()
    }
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		
		// Confirm that a video was selected
		guard tableView.indexPathForSelectedRow != nil else {
			return
		}
 
		// Get reference to the video
		let selectedVideo = video[tableView.indexPathForSelectedRow!.row]
		
		// Get reference to the ViewController
		let detailVC = segue.destination as! DetailViewController
		
		// Set the video property of the detail view Controller
		detailVC.video = selectedVideo
	}
	
	// MARK: - Model Methods Delegate
	func videoFetch(_ videos: [Video]) {
		// Set the return vidio to our vidio property
		self.video = videos
		
		// refresh tableView
		tableView.reloadData()
	}
	
	// MARK: - TableView
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return video.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: Constants.videoCell_ID, for: indexPath) as! VideoTableViewCell
		
		// Configure cell with data
		
		// Get title for video
		let video = self.video[indexPath.row]
		
		//let title = self.video[indexPath.row].title
		
		cell.titleLabel.text = title
		
		cell.setCell(video)
		
		
		// Return cell
		return cell
	}

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
	}
}

