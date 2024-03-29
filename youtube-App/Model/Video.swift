//
//  Video.swift
//  youtube-App
//
//  Created by Adnann Muratovic on 01/06/2020.
//  Copyright © 2020 Adnann Muratovic. All rights reserved.
//

import Foundation

struct Video: Decodable {
	
	var videoId = ""
	var title = ""
	var description = ""
	var thumbnail = ""
	var published: Date
	
	enum CodingKeys: String, CodingKey {
		
		case snippet
		case thumbnails
		case high
		case resourceId
		
		case published = "publishedAt"
		case title
		case description
		case thumbnail = "url"
		case videoId
	}
	
	init (from decoder: Decoder) throws {
		
		let container = try decoder.container(keyedBy: CodingKeys.self)
		
		let snippetContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .snippet)
		
		// Parse title
		self.title = try snippetContainer.decode(String.self, forKey: .title)
		
		// Parse description
		self.description = try snippetContainer.decode(String.self, forKey: .description)
		
		// Parse publish date
		self.published = try snippetContainer.decode(Date.self, forKey: .published)
		
		// Parse thumbnail
		let thumbnailContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .thumbnails)
		
		let highContainer = try thumbnailContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .high)
		self.thumbnail = try highContainer.decode(String.self, forKey: .thumbnail)
		
		// Parse videoID
		let resourceIdContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .resourceId)
		self.videoId = try resourceIdContainer.decode(String.self, forKey: .videoId)
	}
	
}
