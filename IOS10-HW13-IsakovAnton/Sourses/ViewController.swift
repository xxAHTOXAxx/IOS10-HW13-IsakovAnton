//
//  ViewController.swift
//  IOS10-HW13-IsakovAnton
//
//  Created by Антон Исаков on 23.06.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var sectionTitles = ["", "", ""]
    
    private var sectionsData: [[String]] = []
    private var nameSection = ["Авирежим", "Wi-Fi", "Bluetooth", "Сотовая связь", "Режим модема", "VPN"]
    private var icons = [
        "airplane", "wifi.square.fill", "network", "antenna.radiowaves.left.and.right", "antenna.radiowaves.left.and.right", "network", "network", "network", "network", "network", "network", "network", "network", "network", "network", "network", "network", "network", "network", "network", "network", "network", "network"
    ]
    let nameSectionTwo = ["Уведомления", "Звуки", "Тактильные сигналы", "Не беспокоить", "Экранное время"]
    let nameSectionThree = ["Основные", "Пункт управления", "Экран и яркость", "Экран «Домой»", "Универсальный доступ", "Обои", "Siri и Поиск", "Face ID и код- пароль", "Экстренный вызов - SOS", "Уведомление о контакте", "Аккумулятор", "Конфиденциальность и безопасность"]
    
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
        sectionsData = [nameSection, nameSectionTwo, nameSectionThree]
    }
    
    // MARK: - Lifecycle
    
    private func setupHierarchy() {
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.register(ArrowCell.self, forCellReuseIdentifier: "arrowCell")
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
        return sectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return sectionsData[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let text = sectionsData[indexPath.section][indexPath.row]
        let iconName = icons[indexPath.section * sectionTitles.count + indexPath.row]
        
        if indexPath.section == 0 && indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "switchCell", for: indexPath) as! SwitchCell
            let iconImage = UIImage(systemName: iconName)
            cell.iconImageView.image = iconImage
            cell.titleLabel.text = text
            cell.switchControl.isHidden = false
            cell.arrowImageView.isHidden = true
            cell.switchControl.isOn = isAirplaneModeEnabled
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "arrowCell", for: indexPath) as! ArrowCell
            let iconImage = UIImage(systemName: iconName)
            cell.iconImageView.image = iconImage
            cell.titleLabel.text = text
            cell.switchControl.isHidden = true
            cell.arrowImageView.isHidden = false
            
            if text == "Wi-Fi" || text == "VPN" {
                cell.additionalTextLabel.text = "Не подключен"
            } else {
                cell.additionalTextLabel.text = ""
            }
            
            if text == "Bluetooth" {
                cell.additionalTextLabel.text = "Вкл."
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
        return 10
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
