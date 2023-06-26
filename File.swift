//
//  File.swift
//  IOS10-HW13-IsakovAnton
//
//  Created by Антон Исаков on 26.06.2023.
//

import Foundation

// Структура, представляющая иконку
struct Icon {
    let image: UIImage // Изображение иконки
    let name: String // Название иконки
    let iconBackgroundColor: UIColor // Цвет фона иконки
    let optionType: OptionType // Тип опции иконки
    
    // Возможные типы опций иконки
    enum OptionType {
        case switched // Переключатель
        case described(state: ConnectionState) // Описание с состоянием
        case general // Общая опция
    }
    
    // Возможные состояния подключения
    enum ConnectionState {
        case on
        case off
        case notConnected
        case none
    }
}

class ViewController: UIViewController {
    
    // Массив с данными об иконках
    private var icons: [[Icon]] = [
        // Первая секция
        [
            Icon(image: UIImage(systemName: "airplane") ?? UIImage(),
                 name: "Авиарежим",
                 iconBackgroundColor: .systemOrange,
                 optionType: .switched), // Иконка с переключателем
            
            Icon(image: UIImage(systemName: "wifi") ?? UIImage(),
                 name: "Wi-Fi",
                 iconBackgroundColor: .systemBlue,
                 optionType: .described(state: .notConnected)), // Иконка с описанием состояния "notConnected"
            
            Icon(image: UIImage(named: "bluetooth")?.withTintColor(.white) ?? UIImage(),
                 name: "Bluetooth",
                 iconBackgroundColor: .systemBlue,
                 optionType: .described(state: .on)), // Иконка с описанием состояния "on"
            
            Icon(image: UIImage(systemName: "antenna.radiowaves.left.and.right")?.withConfiguration(UIImage.SymbolConfiguration(weight: .semibold)) ?? UIImage(),
                 name: "Сотовая связь",
                 iconBackgroundColor: .systemGreen,
                 optionType: .general), // Общая иконка без специального типа опции
            
            Icon(image: UIImage(systemName: "personalhotspot")?.withConfiguration(UIImage.SymbolConfiguration(weight: .bold)) ?? UIImage(),
                 name: "Режим модема",
                 iconBackgroundColor: .systemGreen,
                 optionType: .described(state: .none)), // Иконка с описанием состояния "none"
            
            Icon(image: UIImage(named: "vpn")?.withTintColor(.white) ?? UIImage(),
                 name: "VPN",
                 iconBackgroundColor: .systemBlue,
                 optionType: .switched) // Иконка с переключателем
        ],
        // Вторая секция
        [
            Icon(image: UIImage(systemName: "bell") ?? UIImage(),
                 name: "Уведомления",
                 iconBackgroundColor: .systemOrange,
                 optionType: .switched),
            
            Icon(image: UIImage(systemName: "") ?? UIImage(),
                 name: "Звуки, тактильные сигналы",
                 iconBackgroundColor: .systemPink,
                 optionType: .general),
            
            Icon(image: UIImage(systemName: "moon.stars") ?? UIImage(),
                 name: "Не беспокоить",
                 iconBackgroundColor: .systemPurple,
                 optionType: .switched)
        ]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // Метод для настройки пользовательского интерфейса
    private func setupUI() {
        // Создание таблицы
        let tableView = UITableView(frame: view.bounds, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(IconCell.self, forCellReuseIdentifier: "IconCell")
        view.addSubview(tableView)
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return icons.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return icons[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IconCell", for: indexPath) as! IconCell
        let icon = icons[indexPath.section][indexPath.row]
        cell.configure(with: icon)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        // Возвращаем заголовок для каждой секции (если необходимо)
        return "Секция \(section + 1)"
    }
}

class IconCell: UITableViewCell {
    // Элементы пользовательского интерфейса
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        return label
    }()
    
    private let optionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Метод для настройки пользовательского интерфейса ячейки
    private func setupUI() {
        addSubview(iconImageView)
        addSubview(nameLabel)
        addSubview(optionLabel)
        
        // Установка констрейнтов для элементов пользовательского интерфейса
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        optionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            // Констрейнты для iconImageView
            iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: 30),
            iconImageView.heightAnchor.constraint(equalToConstant: 30),
            
            // Констрейнты для nameLabel
            nameLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 16),
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            // Констрейнты для optionLabel
            optionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            optionLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        // Дополнительные настройки внешнего вида элементов пользовательского интерфейса
        nameLabel.textColor = .black
        
        // Установка приоритета сжатия для nameLabel и optionLabel
        nameLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        optionLabel.setContentCompressionResistancePriority(.required, for: .horizontal)
    }
    
    // Метод для конфигурации ячейки с данными иконки
    func configure(with icon: Icon) {
        iconImageView.image = icon.image
        nameLabel.text = icon.name
        
        switch icon.optionType {
        case .switched:
            optionLabel.text = "Switched"
        case .described(let state):
            optionLabel.text = "State: \(state)"
        case .general:
            optionLabel.text = "General"
        }
    }
}


