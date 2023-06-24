//
//  ViewController.swift
//  IOS10-HW13-IsakovAnton
//
//  Created by Антон Исаков on 23.06.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Outlets
    
    let cellIdentifier = "Настройки"
    let sectionTitles = ["", "", ""]
    let section1Data = ["Авирежим", "W-Fi", "Bluetooth", "Сотовая связь", "Режим модема", "VPN"]
    let section2Data = ["Уведомления", "Звуки", "Тактильные сигналы", "Не беспокоить", "Экранное время"]
    let section3Data = ["Основные", "Пункт управления", "Экран и яркость", "Экран <<Домой>>", "Универсальный доступ", "Обои", "Siri и Поиск", "Face ID и код- пароль", "Экстренный вызов - SOS", "Уведомление о контакте", "Аккумулятор", "Конфиденциальность и безопасность"]
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        return tableView
    }()

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Настройки"
        setupHierarchy()
        setupLayout ()
    }
    
    // MARK: - Setup
    
    private func setupHierarchy() {
        view.addSubview(tableView)
        
    }
    
    private func setupLayout () {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return section1Data.count
        case 1:
            return section2Data.count
        case 2:
            return section3Data.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        switch indexPath.section {
        case 0:
            cell.textLabel?.text = section1Data[indexPath.row]
        case 1:
            cell.textLabel?.text = section2Data[indexPath.row]
        case 2:
            cell.textLabel?.text = section3Data[indexPath.row]
        default:
            break
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        // Обработка нажатия на ячейку
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                // Обработка нажатия на первый элемент секции 1
                break
            case 1:
                // Обработка нажатия на второй элемент секции 1
                break
            case 2:
                // Обработка нажатия на третий элемент секции 1
                break
            default:
                break
            }
        case 1:
            switch indexPath.row {
            case 0:
                // Обработка нажатия на первый элемент секции 2
                break
            case 1:
                // Обработка нажатия на второй элемент секции 2
                break
            case 2:
                // Обработка нажатия на третий элемент секции 2
                break
            default:
                break
            }
        case 2:
            switch indexPath.row {
            case 0:
                // Обработка нажатия на первый элемент секции 3
                break
            case 1:
                // Обработка нажатия на второй элемент секции 3
                break
            case 2:
                // Обработка нажатия на третий элемент секции 3
                break
            default:
                break
            }
        default:
            break
        }
    }
}


