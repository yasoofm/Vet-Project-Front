import UIKit

class MyRequestViewController: UITableViewController {

    var requests: [BookRequest] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        tableView.register(MyRequestTableViewCell.self, forCellReuseIdentifier: "MyRequestCell")

        let request1 = BookRequest(id: 1, vetName: "Vet. John", CreatedAt: Date(), animal: "Cat")
        let request2 = BookRequest(id: 2, vetName: "Vet. James", CreatedAt: Date(), animal: "Rabbit")
        let request3 = BookRequest(id: 2, vetName: "Vet. Herriot", CreatedAt: Date(), animal: "Dog")
        let request4 = BookRequest(id: 2, vetName: "Vet. Max", CreatedAt: Date(), animal: "Hamster")
        let request5 = BookRequest(id: 2, vetName: "Vet. Zoe", CreatedAt: Date(), animal: "Turtle")

        requests = [request1, request2, request3, request4, request5]

        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    override func tableView( _ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return requests.count
    }

    override func tableView( _ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyRequestCell", for: indexPath) as! MyRequestTableViewCell

        let request = requests[indexPath.row]
        cell.titleLabel.text = request.vetName
        
        let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "d MMM, yyyy HH:mm"
            let formattedDate = dateFormatter.string(from: request.CreatedAt)
            
            cell.detailsLabel.text = "Animal: \(request.animal)\t\t Date: \(formattedDate)"


        // Configure cell with additional details

        return cell
    }


    //TODO


}

