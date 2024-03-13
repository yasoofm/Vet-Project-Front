import UIKit

class Home2TableViewCell: UITableViewCell {
    
    var vets: [VetDetails] = [VetDetails(name: "", username: "", email: "", phoneNumber: 1, specialty: "", experience: 1, equipment: "", image: "", password: "")]
    
 
    let nameLabel = UILabel()
    let specielityLabel = UILabel()
    let accountImageView = UIImageView()
    let favoriteButton = UIButton(type: .system)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(nameLabel)
        contentView.addSubview(specielityLabel)
        contentView.addSubview(accountImageView)
        contentView.addSubview(favoriteButton)
       
        setupViews()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        nameLabel.font = .systemFont(ofSize: 16, weight: .medium)
        nameLabel.textColor = .black
        specielityLabel.font = .systemFont(ofSize: 14, weight: .regular)
        specielityLabel.textColor = .darkGray
        accountImageView.contentMode = .scaleAspectFit
    
        let symbolConfig = UIImage.SymbolConfiguration(pointSize: 13, weight: .medium, scale: .medium)
        let symbolImage = UIImage(systemName: "star.fill", withConfiguration: symbolConfig)
        favoriteButton.setImage(symbolImage, for: .normal)
        favoriteButton.tintColor = .white
        favoriteButton.backgroundColor = .orange
    }
    
    private func setupConstraints() {
       
        accountImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(100)
        }
        nameLabel.snp.makeConstraints { make in
            make.leading.equalTo(accountImageView.snp.trailing).offset(16)
            make.top.equalToSuperview().offset(16)
            make.trailing.lessThanOrEqualToSuperview().offset(-16)
        }
        specielityLabel.snp.makeConstraints { make in
            make.leading.equalTo(nameLabel.snp.leading)
            make.top.equalTo(nameLabel.snp.bottom).offset(8)
            make.trailing.lessThanOrEqualToSuperview().offset(-16)
            make.bottom.lessThanOrEqualToSuperview().offset(-16)
        }
        favoriteButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.width.height.equalTo(30)
        }
    }
}
