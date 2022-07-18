//
//  TownsTableViewController.swift
//  TestTask2-Corpus
//
//  Created by Tony on 15.07.22.
//

import UIKit
import Alamofire
import AlamofireImage

class TownsTableViewController: UITableViewController {
    
    var towns = [Town]()
    var allPlaces = [Place]()
    var townPlaces = [Place]()
    var tempImage : UIImage?
    let URL_GET_TOWNS = "https://krokapp.by/api/get_cities/11/"
    let URL_GET_PLACES = "https://krokapp.by/api/get_points/11/"

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Towns"
        self.tableView.rowHeight = 104.0
        self.getPlaces(fromApi: self.URL_GET_PLACES)
        getTowns(fromApi: URL_GET_TOWNS)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return towns.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "townCell", for: indexPath) as! TownTableViewCell
        
        let town = towns[indexPath.row]
        cell.nameTownLabel.text = town.name
        
        AF.request(town.logo!, method: .get).responseImage { response in
            if case .success(let image) = response.result {
                DispatchQueue.main.async {
                    cell.logoTownImageView.image = image
                }
            }
        }

        return cell
    }
        
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let destination = PlacesTableViewController()
        let selectedTown = towns[indexPath.row]
        destination.townName = selectedTown.name ?? ""
        destination.townPlaces = selectedTown.places
        navigationController?.pushViewController(destination, animated: true)
    }
    
    func getTowns(fromApi url: String) {
        AF.request(url).responseData { response in
            switch response.result {
            case .failure(let error):
                print(error)
            case .success(let data):
                do {
                    let json = try JSONSerialization.jsonObject(with: data)
                    let townsArray : NSArray = json as! NSArray
                    for item in townsArray {
                        if (item as AnyObject).value(forKey: "lang") as? Int == 2,
                           (item as AnyObject).value(forKey: "visible") as? Bool == true{
                            self.towns.append(Town(
                            id: (item as AnyObject).value(forKey: "id") as? Int,
                            name: (item as AnyObject).value(forKey: "name") as? String,
                            logo: (item as AnyObject).value(forKey: "logo") as? String
                            ))
                        }
                        self.townPlaces = []
                    }
                } catch {
                    print("Error while decoding response: \(error) from: \(String(describing: String(data: data, encoding: .utf8)))")
                }
            }
            self.tableView.reloadData()
        }
    }

    
    func getPlaces(fromApi placesUrl: String){
        AF.request(placesUrl).responseData { response in
            switch response.result {
            case .failure(let error):
                print(error)
            case .success(let data):
                do {
                    let jsonObject = try JSONDecoder().decode([Place].self, from: data)
                    self.allPlaces = jsonObject
                    self.addPlacesinTowns()
                } catch {
                    print("Error while decoding response: \(error) from: \(String(describing: String(data: data, encoding: .utf8)))")
                }
            }
        }
    }
    
    func addPlacesinTowns(){
        for town in towns {
            for place in allPlaces {
                if place.city_id == town.id, place.lang == 2 {
                    town.addPlace(place: place)
                }
            }
        }
    }
}
