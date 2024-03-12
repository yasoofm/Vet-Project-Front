import Foundation
import Alamofire

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private let  baseURL = ""
    
    //Post Method: for signing in either as a user or as a vet
    
    func signin(username: String,password: String, completion: @escaping (Result<SignInResponse, Error>) -> Void) {
       let url = baseURL + "signin"
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
    // Post method: for signing up as a user
    func signUpUser(user: User, completion: @escaping (Result<SignInResponse, Error>) -> Void) {
       let url = baseURL + "signupuser"
       AF.request(url, method: .post, parameters: user, encoder: JSONParameterEncoder.default).responseDecodable(of: SignInResponse.self) { response in
           switch response.result {
           case .success(let value):
               completion(.success(value))
           case .failure(let afError):
               completion(.failure(afError as Error))
           }
       }
   }
    
     // Post method: for signing up as a vet
    func signUpVet(vet: VetDetails, completion: @escaping (Result<SignInResponse, Error>) -> Void){
        let url = baseURL + "signupvet"
        AF.request(url, method: .post, parameters: vet, encoder: JSONParameterEncoder.default).responseDecodable(of: SignInResponse.self){ response in
            switch response.result {
            case .success(let value):
                completion(.success(value))
            case .failure(let afError):
                completion(.failure(afError as Error))
            }
        }
        
    }
    
}
