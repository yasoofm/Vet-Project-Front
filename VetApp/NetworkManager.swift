import Foundation
import Alamofire

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private let  baseURL = ""
    
    //Post Method: for signing in either as a user or as a vet
    func signin(username: String,password: String, completion: @escaping (Result<SignInResponse, Error>) -> Void) {
       let url = baseURL + "auth/signin"
        let parameters : [String: String] = ["username": username,"password": password]
       AF.request(url, method: .post, parameters: parameters, encoder: JSONParameterEncoder.default).responseDecodable(of: SignInResponse.self) { response in
           switch response.result {
           case .success(let value):
               completion(.success(value))
           case .failure(let afError):
               completion(.failure(afError as Error))
           }
       }
   }
    
    
    // Post Method: for signing up as a user
    func signUpUser(user: User, completion: @escaping (Result<SignInResponse, Error>) -> Void) {
       let url = baseURL + "auth/user-signup"
       AF.request(url, method: .post, parameters: user, encoder: JSONParameterEncoder.default).responseDecodable(of: SignInResponse.self) { response in
           switch response.result {
           case .success(let value):
               completion(.success(value))
           case .failure(let afError):
               completion(.failure(afError as Error))
           }
       }
   }
    
    
     // Post Method: for signing up as a vet
    func signUpVet(vet: VetDetails, completion: @escaping (Result<SignInResponse, Error>) -> Void){
        let url = baseURL + "auth/vet-signup"
        AF.request(url, method: .post, parameters: vet, encoder: JSONParameterEncoder.default).responseDecodable(of: SignInResponse.self){ response in
            switch response.result {
            case .success(let value):
                completion(.success(value))
            case .failure(let afError):
                completion(.failure(afError as Error))
            }
        }
        
    }
    
    
    // Get Method: To get all vets from user
    func getAllVetsFromUsers(token: String, user: User, completion: @escaping (Result<Void, Error>) -> Void){
        let url = baseURL + "user/vets"
        let headers: HTTPHeaders = [.authorization(bearerToken: token)]
        AF.request(url, method: .get, parameters: user, encoder: JSONParameterEncoder.default, headers: headers).response{ response in
            if let error = response.error {
                completion(.failure(error))
            }
            else {
                completion (.success(()))
            }
        }
    }
    
    
    //Post Method: For users to post request.
    func userPostRequest(token: String, user: User, completion: @escaping (Result<Void, Error>) -> Void){
        let url = baseURL + "user/request"
        let headers: HTTPHeaders = [.authorization(bearerToken: token)]
        AF.request(url, method: .post, parameters: user, encoder: JSONParameterEncoder.default, headers: headers).response{ response in
            if let error = response.error{
                completion(.failure(error))
            }
            else {
                completion(.success(()))
            }
        }
        
    }
    
    
    // Get Method: For users to see their request history
    func userGetHistory(token: String, user: User, completion: @escaping (Result<Void, Error>) -> Void){
        let url = baseURL + "user/history"
        let headers: HTTPHeaders = [.authorization(bearerToken: token)]
        AF.request(url, method: .get, parameters: user, encoder: JSONParameterEncoder.default, headers: headers).response{ response in
            if let error = response.error{
                completion(.failure(error))
            }
            else {
                completion (.success(()))
            }
        }
    }
    
    
    // Get Method: For users to get the status of the vet
    func userGetStatus(token: String, user: User, completion: @escaping (Result<Void, Error>) -> Void){
        let url = baseURL + "user/get-status"
        let headers: HTTPHeaders = [.authorization(bearerToken: token)]
        AF.request(url, method: .get, parameters: user, encoder: JSONParameterEncoder.default, headers: headers).response{ response in
            if let error = response.error{
                completion(.failure(error))
            }
            else {
                completion (.success(()))
            }
        }
    }
    
    
    // Get Method: To get all vets from vets
    func getAllVetsFromVets(token: String, vet: VetDetails, completion: @escaping (Result<Void, Error>) -> Void){
        let url = baseURL + "vet/vets"
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
