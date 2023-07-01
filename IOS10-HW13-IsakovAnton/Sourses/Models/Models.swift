
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
                image: UIImage(named: "airplaneC") ?? UIImage(),
                name: "Авиарежим",
                iconBackgroundColor: .systemOrange)),
        
            .optionCell(cell: OptionCells(
                image: UIImage(named: "wifiC") ?? UIImage(),
                name: "Wi-Fi",
                iconBackgroundColor: .systemBlue, textLabel: "Не подключен")),
            
            .optionCell(cell: OptionCells(
                image: UIImage(named: "bluetoothC")?.withTintColor(.white) ?? UIImage(),
                 name: "Bluetooth",
                 iconBackgroundColor: .systemBlue, textLabel: "Вкл.")),
            
            .optionCell(cell: OptionCells(
                image: UIImage(named: "cellularC") ?? UIImage(),
                 name: "Сотовая связь",
                 iconBackgroundColor: .systemGreen, textLabel: nil)),
            
            .optionCell(cell: OptionCells(
                image: UIImage(named: "personalhotspotС") ?? UIImage(),
                 name: "Режим модема",
                 iconBackgroundColor: .systemGreen, textLabel: nil)),
            
            .optionCell(cell: OptionCells(
                image: UIImage(named: "vpnC") ?? UIImage(),
                 name: "VPN",
                 iconBackgroundColor: .systemBlue, textLabel: "Не подключен")),
        ],
        [
            .optionCell(cell: OptionCells(
                image: UIImage(named: "bellC") ?? UIImage(),
                 name: "Уведомления",
                 iconBackgroundColor: .systemRed, textLabel: nil)),

            .optionCell(cell: OptionCells(
                image: UIImage(named: "speakerC") ?? UIImage(),
                 name: "Звуки, тактильные сигналы",
                 iconBackgroundColor: .systemPink, textLabel: nil)),
            
            .optionCell(cell: OptionCells(
                image: UIImage(named: "moonC") ?? UIImage(),
                 name: "Не беспокоить",
                 iconBackgroundColor: .systemIndigo, textLabel: nil)),
            
            .optionCell(cell: OptionCells(
                image: UIImage(named: "hourglassС") ?? UIImage(),
                 name: "Экранное время",
                 iconBackgroundColor: .systemIndigo, textLabel: nil))
        ],
        [
            .optionCell(cell: OptionCells(
                image: UIImage(named: "settingC") ?? UIImage(),
                 name: "Основные",
                 iconBackgroundColor: .systemGray2, textLabel: nil)),
            
            .optionCell(cell: OptionCells(
                image: UIImage(systemName: "switch.2")?.withTintColor(.white)
                    .withRenderingMode(.alwaysOriginal)
                    .withConfiguration(UIImage.SymbolConfiguration(weight: .regular))
                    ?? UIImage(),
                 name: "Пункт управления",
                 iconBackgroundColor: .systemGray2, textLabel: nil)),
            
            .optionCell(cell: OptionCells(
                image: UIImage(named: "aaC") ?? UIImage(),
                 name: "Экран и яркость",
                 iconBackgroundColor: .systemBlue, textLabel: nil)),
            
            .optionCell(cell: OptionCells(
                image: UIImage(named: "homeC") ?? UIImage(),
                 name: "Экран «Домой»",
                 iconBackgroundColor: nil, textLabel: nil)),
            
            .optionCell(cell: OptionCells(
                image: UIImage(named: "wallpaper") ?? UIImage(),
                 name: "Универсальный доступ",
                 iconBackgroundColor: .systemBlue, textLabel: nil)),
            
            .optionCell(cell: OptionCells(
                image: UIImage(named: "wallpaperС") ?? UIImage(),
                 name: "Обои",
                 iconBackgroundColor: .systemBlue, textLabel: nil)),

            .optionCell(cell: OptionCells(
                image: UIImage(named: "siri") ?? UIImage(),
                 name: "Siri и Поиск",
                 iconBackgroundColor: nil, textLabel: nil)),

            .optionCell(cell: OptionCells(
                image: UIImage(systemName: "faceid")?.withTintColor(.white)
                    .withRenderingMode(.alwaysOriginal)
                    .withConfiguration(UIImage.SymbolConfiguration(weight: .regular))
                    ?? UIImage(),
                 name: "Face ID код-пароль",
                 iconBackgroundColor: .systemGreen, textLabel: nil)),

            .optionCell(cell: OptionCells(
                image: UIImage(systemName: "sos")?.withTintColor(.white)
                    .withRenderingMode(.alwaysOriginal)
                    .withConfiguration(UIImage.SymbolConfiguration(weight: .regular))
                    ?? UIImage(),
                 name: "Экстренный вызов - SoS",
                 iconBackgroundColor: .systemRed, textLabel: nil)),

            .optionCell(cell: OptionCells(
                image: UIImage(systemName: "virus") ?? UIImage(),
                 name: "Уведомление о контакте",
                 iconBackgroundColor: .white, textLabel: nil)),
            
            .optionCell(cell: OptionCells(
                image: UIImage(named: "batteryC") ?? UIImage(),
                 name: "Аккумулятор",
                 iconBackgroundColor: .systemGreen, textLabel: nil)),
            
            .optionCell(cell: OptionCells(
                image: UIImage(named: "stopC") ?? UIImage(),
                 name: "Конфиденциальность\nи безопасность",
                iconBackgroundColor: .systemBlue, textLabel: nil)),
        ]
    ]
}


