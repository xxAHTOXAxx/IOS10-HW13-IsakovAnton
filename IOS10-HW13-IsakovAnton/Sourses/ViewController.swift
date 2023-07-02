import UIKit

class ViewController: UIViewController {
    
    var sectionsData: [[Models]] = []
    
    // MARK: - Outlets
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.register(SwitchCell.self, forCellReuseIdentifier: "switchCell")
        tableView.register(ArrowCell.self, forCellReuseIdentifier: "arrowCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        setupLayout()
        sectionsData = Models.iconCustom
    }
    
    // MARK: - Private functions
    
    private func setupView() {
        view.backgroundColor = .white
        navigationItem.title = "Настройки"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupHierarchy() {
        view.addSubview(tableView)
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

// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
    
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
extension ViewController: UITableViewDelegate {
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




