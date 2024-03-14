import UIKit

class MyRequestViewController: UITableViewController {

    var requests: [BookRequest] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        tableView.register(MyRequestTableViewCell.self, forCellReuseIdentifier: "MyRequestCell")

        let request1 = BookRequest(id: 1, vetName: "Vet. John", CreatedAt: Date(), animal: "Cat")
        let request2 = BookRequest(id: 2, vetName: "Request 2", CreatedAt: Date(), animal: "Rabbit")

        requests = [request1, request2]

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
        cell.detailsLabel.text = "Animal: (request.animal)\t\t Date: (request.CreatedAt)"

        // Configure cell with additional details

        return cell
    }


    //TODO


}

