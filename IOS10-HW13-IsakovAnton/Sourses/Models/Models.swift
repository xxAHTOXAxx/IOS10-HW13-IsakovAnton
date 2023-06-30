
import UIKit

enum Models {
    case switchCell(cell: SwitchCells)
    case optionCell(cell: OptionCells)
    
//    static func getData() -> [[Models]] {
//
//        return [[Models]]
//    }
}

struct SwitchCells {
    let image: UIImage?
    let name: String
    let iconBackgroundColor: UIColor?
}

struct OptionCells {
    let image: UIImage?
    let name: String
    let iconBackgroundColor: UIColor?
    let textLabel: String?
}

extension Models {
    static var iconCustom: [[Models]] = [
        [
            .switchCell(cell: SwitchCells(
                image: UIImage(systemName: "airplane")?
                    .withRenderingMode(.alwaysTemplate)
                    .withTintColor(.white) ?? UIImage(),
                name: "Авиарежим",
                iconBackgroundColor: .systemOrange)),
        
            .optionCell(cell: OptionCells(
                image: UIImage(systemName: "wifi.square") ?? UIImage(),
                name: "Wi-Fi",
                iconBackgroundColor: nil, textLabel: "Не подключен")),
            
            .optionCell(cell: OptionCells(
                image: UIImage(named: "bluetooth")?.withTintColor(.white) ?? UIImage(),
                 name: "Bluetooth",
                 iconBackgroundColor: .systemBlue, textLabel: "Вкл.")),
            
            .optionCell(cell: OptionCells(
                image: UIImage(systemName: "antenna.radiowaves.left.and.right")?.withConfiguration(UIImage.SymbolConfiguration(weight: .semibold)) ?? UIImage(),
                 name: "Сотовая связь",
                 iconBackgroundColor: .systemGreen, textLabel: nil)),
            
            .optionCell(cell: OptionCells(
                image: UIImage(systemName: "personalhotspot")?.withConfiguration(UIImage.SymbolConfiguration(weight: .bold)) ?? UIImage(),
                 name: "Режим модема",
                 iconBackgroundColor: .systemGreen, textLabel: nil)),
            
            .optionCell(cell: OptionCells(
                image: UIImage(named: "vpn")?.withTintColor(.white) ?? UIImage(),
                 name: "VPN",
                 iconBackgroundColor: .systemBlue, textLabel: "Не подключен")),
        ],
        [
            .optionCell(cell: OptionCells(
                image: UIImage(systemName: "bell")?.withTintColor(.white) ?? UIImage(),
                 name: "Уведомления",
                 iconBackgroundColor: .systemOrange, textLabel: nil)),

            .optionCell(cell: OptionCells(
                image: UIImage(systemName: "speaker") ?? UIImage(),
                 name: "Звуки, тактильные сигналы",
                 iconBackgroundColor: .systemPink, textLabel: nil)),
            
            .optionCell(cell: OptionCells(
                image: UIImage(systemName: "wifi") ?? UIImage(),
                 name: "Не беспокоить",
                 iconBackgroundColor: .systemIndigo, textLabel: nil)),
            
            .optionCell(cell: OptionCells(
                image: UIImage(systemName: "wifi") ?? UIImage(),
                 name: "Экранное время",
                 iconBackgroundColor: .systemIndigo, textLabel: nil))
        ],
        [
            .optionCell(cell: OptionCells(
                image: UIImage(systemName: "wifi") ?? UIImage(),
                 name: "Основные",
                 iconBackgroundColor: .systemGray2, textLabel: nil)),
            
            .optionCell(cell: OptionCells(
                image: UIImage(systemName: "switch.2")?.withConfiguration(UIImage.SymbolConfiguration(weight: .regular)) ?? UIImage(),
                 name: "Пункт управления",
                 iconBackgroundColor: .systemGray2, textLabel: nil)),
            
            .optionCell(cell: OptionCells(
                image: UIImage(systemName: "textformat.size")?.withConfiguration(UIImage.SymbolConfiguration(weight: .regular)) ?? UIImage(),
                 name: "Экран и яркость",
                 iconBackgroundColor: .systemBlue, textLabel: nil)),
            
            .optionCell(cell: OptionCells(
                image: UIImage(systemName: "wifi") ?? UIImage(),
                 name: "Экран «Домой»",
                 iconBackgroundColor: nil, textLabel: nil)),
            
            .optionCell(cell: OptionCells(
                image: UIImage(systemName: "wifi") ?? UIImage(),
                 name: "Универсальный доступ",
                 iconBackgroundColor: .systemBlue, textLabel: nil)),
            
            .optionCell(cell: OptionCells(
                image: UIImage(systemName: "wifi") ?? UIImage(),
                 name: "Обои",
                 iconBackgroundColor: .systemCyan, textLabel: nil)),

            .optionCell(cell: OptionCells(
                image: UIImage(named: "") ?? UIImage(),
                 name: "Siri и Поиск",
                 iconBackgroundColor: nil, textLabel: nil)),

            .optionCell(cell: OptionCells(
                image: UIImage(systemName: "faceid") ?? UIImage(),
                 name: "Face ID код-пароль",
                 iconBackgroundColor: .systemCyan, textLabel: nil)),

            .optionCell(cell: OptionCells(
                image: UIImage(systemName: "sos") ?? UIImage(),
                 name: "Экстренный вызов - SoS",
                 iconBackgroundColor: .systemRed, textLabel: nil)),

            .optionCell(cell: OptionCells(
                image: UIImage(systemName: "wifi") ?? UIImage(),
                 name: "Уведомление о контакте",
                 iconBackgroundColor: .white, textLabel: nil)),
            
            .optionCell(cell: OptionCells(
                image: UIImage(systemName: "battery.100") ?? UIImage(),
                 name: "Аккумулятор",
                 iconBackgroundColor: .systemGreen, textLabel: nil)),
            
            .optionCell(cell: OptionCells(
                image: UIImage(systemName: "wifi") ?? UIImage(),
                 name: "Конфиденциальность и безопасность",
                 iconBackgroundColor: .systemBlue, textLabel: nil)),
        ]
    ]
}


