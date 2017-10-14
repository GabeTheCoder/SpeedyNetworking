
import Foundation

class SpeedyResponse {
    
    var success: Bool!
    var statusCode = 0
    
    var error: Error?
    var data: Data?
    
    init(data: Data?, response: URLResponse?, error: Error?) {
        self.error = error
        self.data = data
        
        if let httpResponse = response as? HTTPURLResponse {
            statusCode = httpResponse.statusCode
        }
        
        success = statusCode == 200 && error == nil && data != nil ? true : false
    }
    
    func jsonResults<T>(model: T.Type) -> T? {
        if !success { return nil }
        guard let responseData = data else { return nil }
        
        do {
            return try JSONSerialization.jsonObject(with: responseData) as? T
        } catch {
            return nil
        }
    }
    
    func result<T: Decodable>(model: T.Type) -> T? {
        if !success { return nil }
        guard let responseData = data else { return nil }
        
        do {
            return try JSONDecoder().decode(model, from: responseData)
        } catch {
            return nil
        }
    }
    
}
