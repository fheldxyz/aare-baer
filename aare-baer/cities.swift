//
//  cities.swift
//  aare-baer
//
//  Created by user on 10.07.21.
//

import Foundation

struct Coordinates: Codable {
    var lat, lon: Double
}

struct City: Codable {
    var city, name, longname: String
    var coordinates: Coordinates
    var aare, aare_prec: Double
    var sy, tn, tx: Int
    var forecast: Bool
    var time: Int
    var url, today, widget: String
}

typealias Cities = [City]


class CityData: Codable, ObservableObject {
    
    @Published var cities: Cities


    enum CodingKeys: CodingKey {
        case cities
    }

    func loadfromAPI() {
        let url = URL(string: "https://aareguru.existenz.ch/v2018/cities?app=xyz.fheld.aare-baer&version=0.0.1")! //change to ä
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print("data not recieved, error: \(error?.localizedDescription ?? "error has value nil")")
                return
            }

            guard let decoded = try? JSONDecoder().decode(Cities.self, from: data) else {
                print("decoding of cities-data from api failed")
                return
            }
            DispatchQueue.main.async {
                self.cities = decoded
            }

        }.resume()

    }


    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        cities = try container.decode(Cities.self, forKey: .cities)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(cities, forKey: .cities)
    }


    init() {
        self.cities = Bundle.main.decode(file: "cities.json")
    }

}
