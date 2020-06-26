//
//  VideoTableViewCell.swift
//  youtube-App
//
//  Created by Adnann Muratovic on 26/06/2020.
//  Copyright © 2020 Adnann Muratovic. All rights reserved.
//

import UIKit

class VideoTableViewCell: UITableViewCell {
	
	// MARK: Properties
	@IBOutlet weak var thumbnailImageView: UIImageView!
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var dateLabel: UILabel!
	
	var video: Video?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
	
	func setCell(_ v: Video) {
		self.video = v
		
		// Ensure that we have a video
		guard self.video != nil else  { return }
		
		// Set title
		self.titleLabel.text = video?.title
		print(titleLabel)
		
		// Set the date
		let df = DateFormatter()
		df.dateFormat = "EEEE, MMM d, yyyy"
		self.dateLabel.text = df.string(from: video!.published)
	
		// Check cache before download data
		
		if let cacheData = CactheManager.getVideoCache(self.video!.thumbnail) {
			// Set the thumbnail
			self.thumbnailImageView.image = UIImage(data: cacheData)
			return
		}
		
		// Set the thumbnail
		guard self.video?.thumbnail != "" else { return }
		
		// Download thumbnail data
		let url = URL(string: self.video!.thumbnail)
		
		// Get shered url sesion object
		let sesion = URLSession.shared
		
		// Create data task
		let dataTaks = sesion.dataTask(with: url!) { (data, response, error) in
			
			if error == nil && data != nil {
				
				// Save the data in the cache
				CactheManager.setVideoCache(url!.absoluteString, data)
				
				// Check the downloaded url matches vidio thumbnail url
				
				if url?.absoluteString != self.video?.thumbnail {
					// Video cell has been recycled for another video
					return
				}
				
				// Create image object
				
				let image = UIImage(data: data!)
				
				// Set the image view
				DispatchQueue.main.async {
					self.thumbnailImageView.image = image
				}
				
			}
		}
		
		// start data taks
		dataTaks.resume()
	}
}
