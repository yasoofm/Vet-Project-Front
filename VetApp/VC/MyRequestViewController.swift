import UIKit

class MyRequestViewController: UITableViewController {

    var token: String?
    var role: String?
    var requests: [BookRequest] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        getHistory(token: token ?? "", role: role ?? "")
        
        tableView.register(MyRequestTableViewCell.self, forCellReuseIdentifier: "MyRequestCell")
        
        NotificationCenter.default.addObserver(self, selector: #selector(reloadHistory), name: NSNotification.Name(rawValue: "history"), object: nil)
    }

    // MARK: - Table view data source

    override func tableView( _ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return requests.count
    }

    override func tableView( _ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyRequestCell", for: indexPath) as! MyRequestTableViewCell

        let request = requests[indexPath.row]
        cell.titleLabel.text = request.vetName
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateString = dateFormatter.string(from: request.CreatedAt ?? Date())
        cell.detailsLabel.text = "Animal: \(request.animal)\t\t Date: \(dateString)"

        // Configure cell with additional details

        return cell
    }
    
    @objc func reloadHistory(){
        getHistory(token: self.token ?? "", role: self.role ?? "")
    }

    func getHistory(token: String, role: String){
        var endPoint = "user/history"
        if role == "vet"{
            endPoint = "vet/history"
        }
        NetworkManager.shared.getHistory(token: token, endPoint: endPoint) { result in
            DispatchQueue.main.async {
                switch result{
                case .success(let bookRequests):
                    self.requests = bookRequests
                    self.tableView.reloadData()
                case .failure(let error):
                    print(error)
                }
            }
        }
    }

}

