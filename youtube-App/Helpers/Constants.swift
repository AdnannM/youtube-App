//
//  Constants.swift
//  youtube-App
//
//  Created by Adnann Muratovic on 01/06/2020.
//  Copyright © 2020 Adnann Muratovic. All rights reserved.
//

import Foundation

struct Constants: Codable {
	
	private static var API_KEY = "AIzaSyB1nKErDJKQgZ8TA7vjiYa4PYgPeZsYqnc"
	static var PLAYLIST_ID = "UUB_qr75-ydFVKSF9Dmo6izg"
	static var API_URL = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
	static var videoCell_ID = "VideoCell"
	static var yT_Embeded_URL = "https://www.youtube.com/watch?v=-dIO8NYwCWc&list=PLfoNZDHitwjXMBeShm_2iOq34Q7dlXmBA"
	
}
