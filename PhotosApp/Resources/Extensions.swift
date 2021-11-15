//
//  Extensions.swift
//  PhotosApp
//
//  Created by Decagon on 14/11/2021.
//

import Foundation

extension URLSession {
    //MARK: Get Data From a URL Session
    func getData(url: URL, completion: @escaping ((Result<Data, Error>)->Void) ) {
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(DecodingErrors.failedToFetchData))
                return }
            completion(.success(data))
            
        }.resume()
    }
    
    //MARK: Decode Data Gotten From a URL Session
    func decodeData<T: Decodable> (from url: URL, type: T.Type,
                                   keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy     = .useDefaultKeys,
                                   dataDecodingStrategy: JSONDecoder.DataDecodingStrategy   = .deferredToData,
                                   completion: @escaping ((Result<T, Error>)->Void)
    ) {
        self.getData(url: url) { result in
            switch result {
            case .success(let data):
                let decoder                     = JSONDecoder()
                decoder.keyDecodingStrategy     = keyDecodingStrategy
                decoder.dataDecodingStrategy    = dataDecodingStrategy
                do {
                    let decodededData           = try decoder.decode(T.self, from: data)
                    completion(.success(decodededData))
                } catch {
                    completion(.failure(error))
                    
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    enum DecodingErrors: String, Error {
        case failedToFetchData = "Unable to fetch data from the web....Check your network and try again"
    }
    
}
