//
//  Model.swift
//  youtube-App
//
//  Created by Adnann Muratovic on 01/06/2020.
//  Copyright © 2020 Adnann Muratovic. All rights reserved.
//

import Foundation

class Model {
	func getVideo() {
		
		// Create a URL object
		let url = URL(string: Constants.API_URL)
		
		guard url != nil else { return }
		
		
		// Get a URLSession object
		let session = URLSession.shared
		
		// Get a data task for URLSession object
		let dataTask = session.dataTask(with: url!) { (data, response, error) in
			
			
			// Check if there were any errors
			if error != nil || data == nil {
				return
			}
			
			do {
				
				// Parsing the data in vidio object
				let decoder = JSONDecoder()
				
				decoder.dateDecodingStrategy = .iso8601
				
				let response = try decoder.decode(Response.self, from: data!)
				
				dump(response)
				
			} catch {
				fatalError("Can't parse json")
			}
			
		}
		
		// Kick off the task
		dataTask.resume()
	}
}
