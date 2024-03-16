import Foundation
import Alamofire

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private let  baseURL = "http://localhost:8080/api/v1/"
    
    //Post Method: for signing in either as a user or as a vet
    func signin(request: SigninRequest, completion: @escaping (Result<SignInResponse, Error>) -> Void) {
        
        let url = baseURL + "auth/signin"
        
        AF.request(url, method: .post, parameters: request, encoder: JSONParameterEncoder.default).responseDecodable(of: SignInResponse.self) { response in
            switch response.result {
            case .success(let value):
                // EXTRA LINE FOR DEBUGGING
                if let data = response.data, let str = String(data: data, encoding: .utf8) {
                 print("Raw response: \(str)")
                }
                completion(.success(value))
            case .failure(let afError):
                // EXTRA LINE FOR DEBUGGING
                if let data = response.data, let str = String(data: data, encoding: .utf8) {
                 print("Raw response: \(str)")
                }
                print(afError.localizedDescription)
                completion(.failure(afError as Error))
                
            }
        }
    }
    
    
    // Post Method: for signing up as a user
    func signUpUser(userSignupRequest: UserSignupRequest, completion: @escaping (Result<SignInResponse, Error>) -> Void) {
       let url = baseURL + "auth/user-signup"
       AF.request(url, method: .post, parameters: userSignupRequest, encoder: JSONParameterEncoder.default).responseDecodable(of: SignInResponse.self) { response in
           switch response.result {
           case .success(let value):
               // EXTRA LINE FOR DEBUGGING
               if let data = response.data, let str = String(data: data, encoding: .utf8) {
                print("Raw response: \(str)")
               }
               completion(.success(value))
           case .failure(let afError):
               // EXTRA LINE FOR DEBUGGING
               if let data = response.data, let str = String(data: data, encoding: .utf8) {
                print("Raw response: \(str)")
               }
               completion(.failure(afError as Error))
           }
       }
   }
    
    
     // Post Method: for signing up as a vet
    func signUpVet(vet: VetSignupRequest, completion: @escaping (Result<SignInResponse, Error>) -> Void){
        let url = baseURL + "auth/vet-signup"
        AF.request(url, method: .post, parameters: vet, encoder: JSONParameterEncoder.default).responseDecodable(of: SignInResponse.self){ response in
            switch response.result {
            case .success(let value):
                // EXTRA LINE FOR DEBUGGING
                if let data = response.data, let str = String(data: data, encoding: .utf8) {
                 print("Raw response: \(str)")
                }
                completion(.success(value))
            case .failure(let afError):
                // EXTRA LINE FOR DEBUGGING
                if let data = response.data, let str = String(data: data, encoding: .utf8) {
                 print("Raw response: \(str)")
                }
                completion(.failure(afError as Error))
            }
        }
        
    }
    
    
    // Get Method: To get all vets for user
    func getAllVetsForUsers(token: String, completion: @escaping (Result<[VetDetails], Error>) -> Void){
        let url = baseURL + "user/vets"
        let headers: HTTPHeaders = [.authorization(bearerToken: token)]
        AF.request(url, headers: headers).responseDecodable(of: [VetDetails].self){ response in
            switch response.result{
            case .success(let vets):
                // EXTRA LINE FOR DEBUGGING
                if let data = response.data, let str = String(data: data, encoding: .utf8) {
                 print("Raw response: \(str)")
                }
                completion(.success(vets))
            case .failure(let error):
                // EXTRA LINE FOR DEBUGGING
                if let data = response.data, let str = String(data: data, encoding: .utf8) {
                 print("Raw response: \(str)")
                }
                completion(.failure(error))
                print(error)
            }
        }
    }
    
    // Get Method: To get all vets for vets
    func getAllVetsForVet(token: String, completion: @escaping (Result<[VetDetails], Error>) -> Void){
        let url = baseURL + "vet/vets"
        let headers: HTTPHeaders = [.authorization(bearerToken: token)]
        AF.request(url, headers: headers).responseDecodable(of: [VetDetails].self){ response in
            switch response.result{
            case .success(let vets):
                // EXTRA LINE FOR DEBUGGING
                if let data = response.data, let str = String(data: data, encoding: .utf8) {
                 print("Raw response: \(str)")
                }
                completion(.success(vets))
            case .failure(let error):
                // EXTRA LINE FOR DEBUGGING
                if let data = response.data, let str = String(data: data, encoding: .utf8) {
                 print("Raw response: \(str)")
                }
                completion(.failure(error))
                print(error)
            }
        }
    }
    
    func addFavorite(token: String, vetId: VetId, endPoint: String, completion: @escaping (Result<Void, Error>) -> Void){
        let url = baseURL + endPoint
        let headers: HTTPHeaders = [.authorization(bearerToken: token)]
        AF.request(url, method: .post, parameters: vetId, encoder: JSONParameterEncoder.default, headers: headers).response { response in
            switch response.result{
            case .success:
                completion(.success(()))
            case .failure(let afError):
                completion(.failure(afError as Error))
            }
        }
    }
    
    func deleteFavorite(token: String, vetId: VetId, endPoint: String, completion: @escaping (Result<Void, Error>) -> Void){
        let url = baseURL + endPoint
        let headers: HTTPHeaders = [.authorization(bearerToken: token)]
        AF.request(url, method: .delete, parameters: vetId, encoder: JSONParameterEncoder.default, headers: headers).response { response in
            switch response.result{
            case .success:
                completion(.success(()))
            case .failure(let afError):
                completion(.failure(afError as Error))
            }
        }
    }
    
    func getFavorites(token: String, endPoint: String, completion: @escaping (Result<[VetDetails], Error>) -> Void){
        let url = baseURL + endPoint
        let headers: HTTPHeaders = [.authorization(bearerToken: token)]
        AF.request(url, headers: headers).responseDecodable(of: [VetDetails].self){ response in
            switch response.result{
            case .success(let vets):
                // EXTRA LINE FOR DEBUGGING
                if let data = response.data, let str = String(data: data, encoding: .utf8) {
                 print("Raw response: \(str)")
                }
                completion(.success(vets))
            case .failure(let error):
                // EXTRA LINE FOR DEBUGGING
                if let data = response.data, let str = String(data: data, encoding: .utf8) {
                 print("Raw response: \(str)")
                }
                completion(.failure(error))
                print(error)
            }
        }
    }
    
    func getStatus(token: String, completion: @escaping (Result<StatusResponse, Error>) -> Void){
        let url = baseURL + "vet/get-status"
        let headers: HTTPHeaders = [.authorization(bearerToken: token)]
        AF.request(url, headers: headers).responseDecodable(of: StatusResponse.self) { response in
            switch response.result{
            case .success(let status):
                // EXTRA LINE FOR DEBUGGING
                if let data = response.data, let str = String(data: data, encoding: .utf8) {
                 print("Raw response: \(str)")
                }
                completion(.success(status))
            case .failure(let afError):
                // EXTRA LINE FOR DEBUGGING
                if let data = response.data, let str = String(data: data, encoding: .utf8) {
                 print("Raw response: \(str)")
                }
                completion(.failure(afError as Error))
            }
        }
    }
    
    func updateStatus(token: String, newStatus: StatusResponse, completion: @escaping (Result<StatusResponse, Error>) -> Void){
        let url = baseURL + "vet/set-status"
        let headers: HTTPHeaders = [.authorization(bearerToken: token)]
        AF.request(url, method: .patch, parameters: newStatus, encoder: JSONParameterEncoder.default, headers: headers).responseDecodable(of: StatusResponse.self) { response in
            switch response.result{
            case .success(let status):
                // EXTRA LINE FOR DEBUGGING
                if let data = response.data, let str = String(data: data, encoding: .utf8) {
                 print("Raw response: \(str)")
                }
                completion(.success(status))
            case .failure(let afError):
                // EXTRA LINE FOR DEBUGGING
                if let data = response.data, let str = String(data: data, encoding: .utf8) {
                 print("Raw response: \(str)")
                }
                completion(.failure(afError as Error))
            }
        }
    }
    
    func getHistory(token: String, endPoint: String, completion: @escaping (Result<[BookRequest], Error>) -> Void){
        let url = baseURL + endPoint
        let headers: HTTPHeaders = [.authorization(bearerToken: token)]
        AF.request(url, headers: headers).responseDecodable(of: [BookRequest].self) { response in
            switch response.result{
            case .success(let bookRequests):
                // EXTRA LINE FOR DEBUGGING
                if let data = response.data, let str = String(data: data, encoding: .utf8) {
                 print("Raw response: \(str)")
                }
                completion(.success(bookRequests))
            case .failure(let afError):
                // EXTRA LINE FOR DEBUGGING
                if let data = response.data, let str = String(data: data, encoding: .utf8) {
                 print("Raw response: \(str)")
                }
                completion(.failure(afError as Error))
            }
        }
    }
    
    func bookVet(token: String, request: BookRequest, endpoint: String, completion: @escaping (Result<Void, Error>) -> Void){
        let url = baseURL + endpoint
        let headers: HTTPHeaders = [.authorization(bearerToken: token)]
        AF.request(url, method: .post, parameters: request, encoder: JSONParameterEncoder.default, headers: headers).response { response in
            switch response.result{
            case .success:
                completion(.success(()))
            case .failure(let afError):
                completion(.failure(afError as Error))
            }
        }
    }
    //Post Method: For users to post request.
//    func userPostRequest(token: String, user: User, completion: @escaping (Result<Void, Error>) -> Void){
//        let url = baseURL + "user/request"
//        let headers: HTTPHeaders = [.authorization(bearerToken: token)]
//        AF.request(url, method: .post, parameters: user, encoder: JSONParameterEncoder.default, headers: headers).response{ response in
//            if let error = response.error{
//                completion(.failure(error))
//            }
//            else {
//                completion(.success(()))
//            }
//        }
//        
//    }
    
    
    // Get Method: For users to see their request history
//    func userGetHistory(token: String, user: User, completion: @escaping (Result<Void, Error>) -> Void){
//        let url = baseURL + "user/history"
//        let headers: HTTPHeaders = [.authorization(bearerToken: token)]
//        AF.request(url, method: .get, parameters: user, encoder: JSONParameterEncoder.default, headers: headers).response{ response in
//            if let error = response.error{
//                completion(.failure(error))
//            }
//            else {
//                completion (.success(()))
//            }
//        }
//    }
    
    
    // Get Method: For users to get the status of the vet
//    func userGetStatus(token: String, user: User, completion: @escaping (Result<Void, Error>) -> Void){
//        let url = baseURL + "user/get-status"
//        let headers: HTTPHeaders = [.authorization(bearerToken: token)]
//        AF.request(url, method: .get, parameters: user, encoder: JSONParameterEncoder.default, headers: headers).response{ response in
//            if let error = response.error{
//                completion(.failure(error))
//            }
//            else {
//                completion (.success(()))
//            }
//        }
//    }
    
    // Update Method: For vets to update their status
    func vetUpdateStatus(token: String, vet: VetDetails, completion: @escaping (Result<Void, Error>) -> Void){
        let url = baseURL + "vet/set-status"
        let headers: HTTPHeaders = [.authorization(bearerToken: token)]
        AF.request(url, method: .patch, parameters: vet, encoder: JSONParameterEncoder.default, headers: headers).response{ response in
            if let error = response.error{
                completion(.failure(error))
            }
            else {
                completion (.success(()))
            }
        }
    }
    
    
    // Get Method: For users to get the vets status
    func userGetVetStatus(token: String, vet: VetDetails, completion: @escaping (Result<Void, Error>) -> Void){
        let url = baseURL + "vet/get-status"
        let headers: HTTPHeaders = [.authorization(bearerToken: token)]
        AF.request(url, method: .get, parameters: vet, encoder: JSONParameterEncoder.default, headers: headers).response{ response in
            if let error = response.error{
                completion(.failure(error))
            }
            else {
                completion (.success(()))
            }
        }
    }
    
}
