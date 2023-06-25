//
//  ViewController.swift
//  IOS10-HW13-IsakovAnton
//
//  Created by Антон Исаков on 23.06.2023.
//

import UIKit


//struct Sections: Hashable {
//    var name: String
//
//    var button: UIButton
//}

//    enum NamesSections: String {
//        case AviMode = "Авирежим"
//        case wiFi = "Wi-Fi"
//        case bluetooth = "Bluetooth"
//    }



class ViewController: UIViewController {
    
    
    
    var sectionTitles = ["", "", ""]
    
    private var sectionsData: [[String]] = []
    private var nameSection = ["Авирежим", "Wi-Fi", "Bluetooth", "Сотовая связь", "Режим модема", "VPN"]
    private var icons = ["airplane", "wifi", "network", "antenna.radiowaves.left.and.right", "antenna.radiowaves.left.and.right", "network", "network", "network", "network", "network", "network", "network", "network", "network", "network", "network", "network", "network", "network", "network", "network", "network", "network"]
    let nameSectionTwo = ["Уведомления", "Звуки", "Тактильные сигналы", "Не беспокоить", "Экранное время"]
    let nameSectionThree = ["Основные", "Пункт управления", "Экран и яркость", "Экран «Домой»", "Универсальный доступ", "Обои", "Siri и Поиск", "Face ID и код- пароль", "Экстренный вызов - SOS", "Уведомление о контакте", "Аккумулятор", "Конфиденциальность и безопасность"]
    
    private var isAirplaneModeEnabled = false
    
    // MARK: - Outlets
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(SwitchCell.self, forCellReuseIdentifier: "switchCell")
        tableView.delegate = self
        //tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
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
        //        switch section {
//        case 0:
//            return nameSection.count
//        case 1:
//            return nameSectionTwo.count
//        case 2:
//            return nameSectionThree.count
//        default:
//            return 0
//        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "switchCell", for: indexPath) as! SwitchCell
//        let iconName: String
//        let text: String
        let text = sectionsData[indexPath.section][indexPath.row]
        let iconName = icons[indexPath.section * sectionTitles.count + indexPath.row]
       
        
//        switch indexPath.section {
//        case 0:
//            iconName = icons[indexPath.row]
//            text = nameSection[indexPath.row]
            
            let iconImage = UIImage(systemName: iconName)
            cell.imageView?.image = iconImage
            cell.titleLabel.text = text
            
//            if indexPath.row == 0 { // Проверяем, что это ячейка "Авирежим"
//                cell.switchControl.isHidden = false // Показываем переключатель для ячейки "Авирежим"
//                //                cell.switchControl.addTarget(self, action: #selector(airplaneModeSwitchValueChanged(_:)), for: .valueChanged)
//                cell.switchControl.isOn = isAirplaneModeEnabled
//            } else {
//                cell.switchControl.isHidden = true // Скрываем переключатель для других ячеек
//            }
//
//        case 1:
//            iconName = icons[indexPath.row]
//            text = nameSectionTwo[indexPath.row]
//            cell.imageView?.image = UIImage(systemName: iconName)
//            cell.titleLabel.text = text
//            cell.switchControl.isHidden = true // Скрываем переключатель для ячеек во втором разделе
//
//        case 2:
//            iconName = icons[indexPath.row]
//            text = nameSectionThree[indexPath.row]
//            cell.imageView?.image = UIImage(systemName: iconName)
//            cell.titleLabel.text = text
//            cell.switchControl.isHidden = true // Скрываем переключатель для ячеек в третьем разделе
//
//        default:
//            return UITableViewCell()
//        }
//        return cell
//    }
            
            
            if indexPath.section == 0 && indexPath.row == 0 { // Проверяем, что это ячейка "Авирежим" в первой секции
                cell.switchControl.isHidden = false // Показываем переключатель для ячейки "Авирежим"
                cell.switchControl.addTarget(self, action: #selector(airplaneModeSwitchValueChanged(_:)), for: .valueChanged)
                cell.switchControl.isOn = isAirplaneModeEnabled
            } else {
                cell.switchControl.isHidden = true // Скрываем переключатель для других ячеек
            }
            
            return cell
        }
       @objc func airplaneModeSwitchValueChanged(_ sender: UISwitch) {
            isAirplaneModeEnabled = sender.isOn
            // Обработка изменения состояния авиарежима
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.addSubview(iconImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(switchControl)
        
        NSLayoutConstraint.activate([
            iconImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            iconImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: 24),
            iconImageView.heightAnchor.constraint(equalToConstant: 24),
            
            titleLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: switchControl.leadingAnchor, constant: -10),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            switchControl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            switchControl.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}


//class SwitchCell: UITableViewCell {
//    let titleLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//
//    let switchControl: UISwitch = {
//        let switchControl = UISwitch()
//        switchControl.translatesAutoresizingMaskIntoConstraints = false
//        return switchControl
//    }()
//
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//
//        setupUI()
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    private func setupUI() {
//        contentView.addSubview(titleLabel)
//        contentView.addSubview(switchControl)
//
//        NSLayoutConstraint.activate([
//            switchControl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
//            switchControl.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
//            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30), // Adjust the leading constraint to create spacing between icon and label
//            titleLabel.trailingAnchor.constraint(equalTo: switchControl.leadingAnchor, constant: -10), // Adjust the trailing constraint to create spacing between icon and label
//            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
//        ])
//    }
//}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10  // Подстройте это значение, чтобы задать желаемое расстояние между секциями
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .clear
        return headerView
    }
}


//class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
//
//    // MARK: - Outlets
//
//    let cellIdentifier = "Настройки"
//    let sectionTitles = ["", "", ""]
//    let section1Data = ["Авирежим", "W-Fi", "Bluetooth", "Сотовая связь", "Режим модема", "VPN"]
//    let section2Data = ["Уведомления", "Звуки", "Тактильные сигналы", "Не беспокоить", "Экранное время"]
//    let section3Data = ["Основные", "Пункт управления", "Экран и яркость", "Экран «Домой»", "Универсальный доступ", "Обои", "Siri и Поиск", "Face ID и код- пароль", "Экстренный вызов - SOS", "Уведомление о контакте", "Аккумулятор", "Конфиденциальность и безопасность"]
//
//    private lazy var tableView: UITableView = {
//        let tableView = UITableView(frame: .zero, style: .grouped)
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//        tableView.delegate = self
//        tableView.dataSource = self
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
//        return tableView
//    }()
//
//    // MARK: - Lifecycle
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        title = "Настройки"
//        setupHierarchy()
//        setupLayout ()
//    }
//
//    // MARK: - Setup
//
//    private func setupHierarchy() {
//        view.addSubview(tableView)
//
//    }
//
//    private func setupLayout () {
//        NSLayoutConstraint.activate([
//            tableView.topAnchor.constraint(equalTo: view.topAnchor),
//            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
//        ])
//    }
//
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return sectionTitles.count
//    }
//
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        switch section {
//        case 0:
//            return section1Data.count
//        case 1:
//            return section2Data.count
//        case 2:
//            return section3Data.count
//        default:
//            return 0
//        }
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
//
//        switch indexPath.section {
//        case 0:
//            cell.textLabel?.text = section1Data[indexPath.row]
//        case 1:
//            cell.textLabel?.text = section2Data[indexPath.row]
//        case 2:
//            cell.textLabel?.text = section3Data[indexPath.row]
//        default:
//            break
//        }
//
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return sectionTitles[section]
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//
//        // Обработка нажатия на ячейку
//        switch indexPath.section {
//        case 0:
//            switch indexPath.row {
//            case 0:
//                // Обработка нажатия на первый элемент секции 1
//                break
//            case 1:
//                // Обработка нажатия на второй элемент секции 1
//                break
//            case 2:
//                // Обработка нажатия на третий элемент секции 1
//                break
//            default:
//                break
//            }
//        case 1:
//            switch indexPath.row {
//            case 0:
//                // Обработка нажатия на первый элемент секции 2
//                break
//            case 1:
//                // Обработка нажатия на второй элемент секции 2
//                break
//            case 2:
//                // Обработка нажатия на третий элемент секции 2
//                break
//            default:
//                break
//            }
//        case 2:
//            switch indexPath.row {
//            case 0:
//                // Обработка нажатия на первый элемент секции 3
//                break
//            case 1:
//                // Обработка нажатия на второй элемент секции 3
//                break
//            case 2:
//                // Обработка нажатия на третий элемент секции 3
//                break
//            default:
//                break
//            }
//        default:
//            break
//        }
//    }
//}
//

