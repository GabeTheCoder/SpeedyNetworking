
import Foundation

enum SpeedyMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

class SpeedyRequest {
    
    var request: URLRequest!
    
    var baseUrl: URL?
    var fullUrl: URL!

    var httpMethod: SpeedyMethod!
    var httpParams: SpeedyParams?
    
    init?(route: String? = nil, url: URL? = nil, method: SpeedyMethod = .get, params: SpeedyParams? = nil) {
        httpMethod = method
        httpParams = params
        
        if let requestBase = SpeedyConfiguration.shared.defaultUrl, let requestRoute = route {
            baseUrl = requestBase
            fullUrl = requestBase.appendingPathComponent(requestRoute)
        } else if let requestUrl = url {
            fullUrl = requestUrl
        } else {
            return nil
        }
        
        configureRequest()
    }
    
    func configureRequest() {
        request = URLRequest(url: fullUrl)
        request.httpMethod = httpMethod.rawValue
        
        if let params = httpParams {
            request.httpBody = params.paramData
        }
        
        if let _ = baseUrl {
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue(SpeedyConfiguration.shared.defaultAuthorizationHeader, forHTTPHeaderField: "Authorization")
        }
    }
    
    func execute(completion: @escaping (SpeedyResponse) -> Void) {
        URLSession.shared.dataTask(with: request) { data, response, error in
            let response = SpeedyResponse(data: data, response: response, error: error)
            
            DispatchQueue.main.async {
                completion(response)
            }
            
            self.logDebug(data: data)
        }.resume()
    }
    
    func logDebug(data: Data?) {
        guard let debugData = data else { return }
        
        let responseString = String(data: debugData, encoding: String.Encoding.utf8) ?? ""
        print(responseString)
    }
    
}
