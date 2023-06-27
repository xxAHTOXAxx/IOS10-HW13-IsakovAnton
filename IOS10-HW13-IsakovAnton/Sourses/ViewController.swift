import UIKit

struct Icon {
    let image: UIImage? // Изображение иконки
    let name: String // Название иконки
    let iconBackgroundColor: UIColor? // Цвет фона иконки
}

extension Icon {
    static var iconCustom: [[Icon]] = [
        [
            Icon(image: UIImage(systemName: "airplane") ?? UIImage(),
                 name: "Авиарежим",
                 iconBackgroundColor: .systemOrange),
            
            Icon(image: UIImage(systemName: "wifi") ?? UIImage(),
                 name: "Wi-Fi",
                 iconBackgroundColor: .systemBlue),
            
            Icon(image: UIImage(named: "bluetooth")?.withTintColor(.white) ?? UIImage(),
                 name: "Bluetooth",
                 iconBackgroundColor: .systemBlue),
            
            Icon(image: UIImage(systemName: "antenna.radiowaves.left.and.right")?.withConfiguration(UIImage.SymbolConfiguration(weight: .semibold)) ?? UIImage(),
                 name: "Сотовая связь",
                 iconBackgroundColor: .systemGreen),
            
            Icon(image: UIImage(systemName: "personalhotspot")?.withConfiguration(UIImage.SymbolConfiguration(weight: .bold)) ?? UIImage(),
                 name: "Режим модема",
                 iconBackgroundColor: .systemGreen),
            
            Icon(image: UIImage(named: "vpn")?.withTintColor(.white) ?? UIImage(),
                 name: "VPN",
                 iconBackgroundColor: .systemBlue),
        ],
        [
            Icon(image: UIImage(systemName: "bell") ?? UIImage(),
                 name: "Уведомления",
                 iconBackgroundColor: .systemOrange),

            Icon(image: UIImage(systemName: "speaker") ?? UIImage(),
                 name: "Звуки, тактильные сигналы",
                 iconBackgroundColor: .systemPink),
            
            Icon(image: UIImage(systemName: "wifi") ?? UIImage(),
                 name: "Не беспокоить",
                 iconBackgroundColor: .systemIndigo),
            
            Icon(image: UIImage(systemName: "wifi") ?? UIImage(),
                 name: "Экранное время",
                 iconBackgroundColor: .systemIndigo)
        ],
        [
            Icon(image: UIImage(systemName: "wifi") ?? UIImage(),
                 name: "Основные",
                 iconBackgroundColor: .systemGray2),
            
            Icon(image: UIImage(systemName: "switch.2")?.withConfiguration(UIImage.SymbolConfiguration(weight: .regular)) ?? UIImage(),
                 name: "Пункт управления",
                 iconBackgroundColor: .systemGray2),
            
            Icon(image: UIImage(systemName: "textformat.size")?.withConfiguration(UIImage.SymbolConfiguration(weight: .regular)) ?? UIImage(),
                 name: "Экран и яркость",
                 iconBackgroundColor: .systemBlue),
            
            Icon(image: UIImage(systemName: "wifi") ?? UIImage(),
                 name: "Экран «Домой»",
                 iconBackgroundColor: nil),
            
            Icon(image: UIImage(systemName: "wifi") ?? UIImage(),
                 name: "Универсальный доступ",
                 iconBackgroundColor: .systemBlue),
            
            Icon(image: UIImage(systemName: "wifi") ?? UIImage(),
                 name: "Обои",
                 iconBackgroundColor: .systemCyan),

            Icon(image: UIImage(named: "") ?? UIImage(),
                 name: "Siri и Поиск",
                 iconBackgroundColor: nil),

            Icon(image: UIImage(systemName: "faceid") ?? UIImage(),
                 name: "Face ID код-пароль",
                 iconBackgroundColor: .systemCyan),

            Icon(image: UIImage(systemName: "sos") ?? UIImage(),
                 name: "Экстренный вызов - SoS",
                 iconBackgroundColor: .systemRed),

            Icon(image: UIImage(systemName: "wifi") ?? UIImage(),
                 name: "Уведомление о контакте",
                 iconBackgroundColor: .white),
            
            Icon(image: UIImage(systemName: "battery.100") ?? UIImage(),
                 name: "Аккумулятор",
                 iconBackgroundColor: .systemGreen),
            
            Icon(image: UIImage(systemName: "wifi") ?? UIImage(),
                 name: "Конфиденциальность и безопасность",
                 iconBackgroundColor: .systemBlue),
        ]
    ]
}

class ViewController: UIViewController {
    
    private var sectionsData: [[Icon]] = []
    private var isAirplaneModeEnabled = false
    
    // MARK: - Outlets
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(SwitchCell.self, forCellReuseIdentifier: "switchCell")
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad ()
        view.backgroundColor = .white
        navigationItem.title = "Настройки"
        navigationController?.navigationBar.prefersLargeTitles = true
        setupHierarchy ()
        setupLayout()
        sectionsData = Icon.iconCustom
    }
    
    // MARK: - Lifecycle
    
    private func setupHierarchy() {
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.register(ArrowCell.self, forCellReuseIdentifier: "arrowCell")
        //tableView.register(SwitchCell.self, forCellReuseIdentifier: "switchCell")
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Icon.iconCustom.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return sectionsData[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let iconSection = Icon.iconCustom[indexPath.section]
           let icon = iconSection[indexPath.row]
           let iconName = icon.name
           
           if indexPath.section == 0 && indexPath.row == 0 {
               let cell = tableView.dequeueReusableCell(withIdentifier: "switchCell", for: indexPath) as! SwitchCell
               let iconImage = UIImage(systemName: iconName)
               cell.iconImageView.image = iconImage
               cell.titleLabel.text = icon.name
               cell.switchControl.isHidden = false
               cell.arrowImageView.isHidden = true
               cell.switchControl.isOn = isAirplaneModeEnabled
               cell.switchControl.addTarget(self, action: #selector(airplaneModeSwitchValueChanged(_:)), for: .valueChanged)
               return cell
           } else {
               let cell = tableView.dequeueReusableCell(withIdentifier: "arrowCell", for: indexPath) as! ArrowCell
               let iconImage = UIImage(systemName: iconName)
               cell.iconImageView.image = iconImage
               cell.titleLabel.text = icon.name
               cell.switchControl.isHidden = true
               cell.arrowImageView.isHidden = false
               cell.additionalTextLabel.text = ""
        
               if iconName == "Wi-Fi" || iconName == "VPN" {
                   cell.additionalTextLabel.text = "Не подключен"
               } else if iconName == "Bluetooth" {
                   cell.additionalTextLabel.text = "Вкл."
               } else {
                   cell.additionalTextLabel.text = ""
               }
               
            return cell
        }
    }
    
    @objc func airplaneModeSwitchValueChanged(_ sender: UISwitch) {
        isAirplaneModeEnabled = sender.isOn
    }
}

class SwitchCell: UITableViewCell {
    let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let switchControl: UISwitch = {
        let switchControl = UISwitch()
        switchControl.translatesAutoresizingMaskIntoConstraints = false
        return switchControl
    }()
    
    let arrowImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "chevron.right"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupHierarchy() {
        contentView.addSubview(iconImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(switchControl)
        contentView.addSubview(arrowImageView)
    }
    
    private func setupLayout() {
        
        NSLayoutConstraint.activate([
            iconImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            iconImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: 24),
            iconImageView.heightAnchor.constraint(equalToConstant: 24),
            
            titleLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: switchControl.leadingAnchor, constant: -10),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            switchControl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            switchControl.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            arrowImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            arrowImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .clear
        return headerView
    }
}

class ArrowCell: UITableViewCell {
    let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let switchControl: UISwitch = {
        let switchControl = UISwitch()
        switchControl.translatesAutoresizingMaskIntoConstraints = false
        return switchControl
    }()
    
    let arrowImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "chevron.right"))
        imageView.tintColor = .systemGray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let additionalTextLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let additionalTextLabelOnOff: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupHierarchy() {
        contentView.addSubview(iconImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(arrowImageView)
        contentView.addSubview(additionalTextLabel)
        contentView.addSubview(additionalTextLabelOnOff)
    }
    
    private func setupLayout() {
        
        NSLayoutConstraint.activate([
            
            iconImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            iconImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: 24),
            iconImageView.heightAnchor.constraint(equalToConstant: 24),
            
            titleLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: arrowImageView.leadingAnchor, constant: -10),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            arrowImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            arrowImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            additionalTextLabel.leadingAnchor.constraint(equalTo: arrowImageView.trailingAnchor, constant: -120),
            additionalTextLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            additionalTextLabelOnOff.leadingAnchor.constraint(equalTo: arrowImageView.trailingAnchor, constant: -10),
            additionalTextLabelOnOff.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}

