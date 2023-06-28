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
        super.viewDidLoad ()
        setupView()
        setupHierarchy ()
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
            let cell = tableView.dequeueReusableCell(withIdentifier: "switchCell", for: indexPath) as! SwitchCell
            cell.configuration(model: model)
            return cell
        case let .optionCell(model):
            let cell = tableView.dequeueReusableCell(withIdentifier: "arrowCell", for: indexPath) as! ArrowCell
            cell.configuration(model: model)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedModel = sectionsData[indexPath.section][indexPath.row]
            
            switch selectedModel {
            case let .switchCell(model):
                print("Выбрана ячейка SwitchCell с моделью: \(model)")
            case let .optionCell(model):
                print("Выбрана ячейка ArrowCell с моделью: \(model)")
            }
            
            tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
}



