//
//  current.swift
//  aare-baer
//
//  Created by user on 11.07.21.
//

import Foundation

// MARK: - Welcome
struct CurrentStruct: Codable {
    var aare: Aare
    var aarepast: [Aarepast]
    var weather: Weather
    var weatherpast: [Weatherpast]
    var sun: Sun
    var bueber: Bueber?
    //var notification: JSONNull?
}

// MARK: - Aare
struct Aare: Codable {
    var location, location_long: String
    //var coordinates: Coordinates
    var forecast: Bool
    var timestamp: Int
    var timestring: String
    var temperature, temperature_prec: Double
    var temperature_text, temperature_text_short: String
    var flow: Int
    var flow_text: String
    var forecast2h: Double
    var forecast2h_text: String
    var temperature_scale, flow_scale: [Scale]

}

// MARK: - Coordinates

// Is already defined in cities.swift

//struct Coordinates: Codable {
//    var lat, lon: Double
//}

// MARK: - Scale
struct Scale: Codable {
    var value: Int
    var text: String
    //var position: Position
}


// MARK: - Aarepast
struct Aarepast: Codable {
    var timestamp, flow: Int
    var temperature: Double
}

// MARK: - Bueber
struct Bueber: Codable {
    var state: String
    var state_open_flag: Bool
    var source: String
    var time: Int

}

// MARK: - Sun
struct Sun: Codable {
    var today: SunToday
    var forecast: [String: ForecastValue]
    var sunlocations: [Sunlocation]
}

// MARK: - ForecastValue
struct ForecastValue: Codable {
    var day, dayshort, suntotal: String
    var sunrelative: Int
}

// MARK: - Sunlocation
struct Sunlocation: Codable {
    var name: String
    var sunrise: Int
    var sunriselocal: String
    var sunset: Int
    var sunsetlocal: String
    var timeleft: Int
    var timeleftstring: String
}

// MARK: - SunToday
struct SunToday: Codable {
    var suntotal: String
    var sunrelative: Int
}

// MARK: - Weather
struct Weather: Codable {
    var current: Current
    var today: WeatherToday
    var forecast: [ForecastElement]
}

// MARK: - Current
struct Current: Codable {
    var tt: Double
    var rr, rrreal, timestamp: Int
    var timestring: String
}

// MARK: - ForecastElement
struct ForecastElement: Codable {
    var day, dayshort: String
    var timestamp: Int
    var sy, syt: String
    var symt, tx, tn, rr: Int
    var rrisk: Int
}

// MARK: - WeatherToday
struct WeatherToday: Codable {
    var v, n, a: A
}

// MARK: - A
struct A: Codable {
    var sy, syt: String
    var symt, tt, rr, rrisk: Int
}

// MARK: - Weatherpast
struct Weatherpast: Codable {
    var timestamp: Int
    var tt: Double
}

// MARK: - Encode/decode helpers

//class JSONNull: Codable, Hashable {
//
//    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
//        return true
//    }
//
//    public var hashValue: Int {
//        return 0
//    }
//
//    public init() {}
//
//    public required init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        if !container.decodeNil() {
//            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
//        }
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        try container.encodeNil()
//    }
//}


//class wrapper to make conformance to codable easier
class CurrentData: Codable, ObservableObject {
    
    @Published var current: CurrentStruct
    
    enum CodingKeys: CodingKey {
        case current
    }
    
    
    func loadfromAPI() {
        let url = URL(string: "https://aareguru.existenz.ch/v2018/current?city=thun&app=xyz.fheld.aare-baer&version=0.0.1")!
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print("data not recieved, error: \(error?.localizedDescription ?? "error has value nil")")
                return
            }
            guard let decoded = try? JSONDecoder().decode(CurrentStruct.self, from: data) else {
                print("decoing of current-data from api failed")
                return
            }
            DispatchQueue.main.async {
                self.current = decoded
            }
        }.resume()
    }
    
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        current = try container.decode(CurrentStruct.self, forKey: .current)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(current, forKey: .current)
    }
    
    init() {
        self.current = Bundle.main.decode(file: "current.json")
    }
    
}
