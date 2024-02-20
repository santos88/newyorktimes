//
//  PreviewExtension.swift
//  The New York Times
//
//  Created by Santos Ramon on 19/02/24.
//

import Foundation

extension Result {
    static var sampleData: Result {
        return Result(
            uri: "nyt://article/a27ba0bc-4655-5c2f-a412-bd2e8429afac",
            url: "https://www.nytimes.com/2024/02/09/travel/icon-of-the-seas-cruise-royal-caribbean.html",
            id: 100000009299799,
            assetID: 100000009299799,
            source: .newYorkTimes,
            publishedDate: "2024-02-14",
            updated: "2024-02-15T12:00:00",
            section: "Travel",
            subsection: "",
            nytdsection: "travel",
            adxKeywords: "Travel and Vacations;Cruises;Royal Caribbean Cruises Ltd;Caribbean Area",
            column: nil,
            byline: "By Ceylan Yeginsu and Scott McIntyre",
            type: .article,
            title: "On the World’s Largest Cruise Ship, Thrills and Space to Chill",
            abstract: "Our reporter joined thousands of passengers on the inaugural sailing of Royal Caribbean’s Icon of the Seas. Yes, the water rides were wild. But the most surprising thing she found? Some actual peace and quiet.",
            desFacet: ["Travel and Vacations", "Cruises"],
            orgFacet: ["Royal Caribbean Cruises Ltd"],
            perFacet: [],
            geoFacet: ["Caribbean Area"],
            media: [Media.sampleData], 
            etaID: 0
        )
    }
}

extension Media {
    static var sampleData: Media {
        return Media(
            type: .image,
            subtype: .photo,
            caption: "Onlookers wave at the largest ship in the world as it departs Port Miami.",
            copyright: "Scott McIntyre for The New York Times",
            approvedForSyndication: 1,
            mediaMetadata: [
                MediaMetadatum(
                    url:  "https://static01.nyt.com/images/2024/02/11/fashion/PUPPY-BOWL-mwkv/PUPPY-BOWL-mwkv-mediumThreeByTwo440.jpg",
                    format: .mediumThreeByTwo440,
                    height: 293,
                    width: 440
                )
            ]
        )
    }
}
