import UIKit

final class MainController: UIViewController {
    
    var sectionsData: [[Models]] = []
    
    private var mainView: MainView? {
        guard isViewLoaded else { return nil }
        return view as? MainView
    }
    
    // MARK: - LifeStyle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = MainView()
        setupView()
        setupHierarchy()
        mainView?.setupLayout()
        setting()
    }
    
    // MARK: - Private functions
    
    private func setupView() {
        view.backgroundColor = .white
        navigationItem.title = "Настройки"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupHierarchy() {
        view.addSubview(mainView?.tableView ?? UITableView())
    }
    
    private func setting() {
        sectionsData = Models.iconCustom
        mainView?.tableView.dataSource = self
        mainView?.tableView.delegate = self
    }
    
}

// MARK: - UITableViewDataSource

extension MainController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        sectionsData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sectionsData[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let model = sectionsData[indexPath.section][indexPath.row]
        
        switch model {
        case  let .switchCell(model):
            let cell = tableView.dequeueReusableCell(withIdentifier: "switchCell", for: indexPath) as? SwitchCell
            cell?.configuration(model: model)
            return cell ?? UITableViewCell()
        case let .optionCell(model):
            let cell = tableView.dequeueReusableCell(withIdentifier: "arrowCell", for: indexPath) as? ArrowCell
            cell?.configuration(model: model)
            return cell ?? UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        30
    }
}

// MARK: - UITableViewDelegate
extension MainController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedModel = sectionsData[indexPath.section][indexPath.row]
        
        switch selectedModel {
        case let .switchCell(model):
            print("Выбрана ячейка SwitchCell с моделью: \(model.name)")
        case let .optionCell(model):
            print("Выбрана ячейка ArrowCell с моделью: \(model.name)")
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
