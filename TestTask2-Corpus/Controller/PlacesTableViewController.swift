//
//  PlacesTableViewController.swift
//  TestTask2-Corpus
//
//  Created by Tony on 18.07.22.
//

import UIKit
import Alamofire
import AlamofireImage


class PlacesTableViewController: UITableViewController {
    
    var townPlaces = [Place]()
    var townName = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.rowHeight = 104
        self.title = townName
        self.tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return townPlaces.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.register(PlaceTableViewCell.self, forCellReuseIdentifier: "placeCell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "placeCell", for: indexPath) as! PlaceTableViewCell
        
        let place = townPlaces[indexPath.row]
        cell.namePlaceLabel.text = place.name
        
        AF.request(place.logo!, method: .get).responseImage { response in
            if case .success(let image) = response.result {
                DispatchQueue.main.async {
                    cell.logoPlaceImageView.image = image
                }
            }
        }

        return cell
    }
    
}
