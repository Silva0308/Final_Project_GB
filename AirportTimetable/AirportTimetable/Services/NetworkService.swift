//
//  NetworkManager.swift
//  AirportTimetable
//
//  Created by MacBook Pro on 14/09/23.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}
//класс для работы с сетью 
final class NetworkService {
    static let worker = NetworkService()
    
    private init() {}
    
    func fetch<T: Decodable>(_ type: T.Type, from url: URL, completion: @escaping(Result<T, NetworkError>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data else {
                completion(.failure(.noData))
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let dataModel = try decoder.decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(dataModel))
                }
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
}
