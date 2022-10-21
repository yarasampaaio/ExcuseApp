import UIKit
import Foundation

class ExcusesUsedView: UIView {

    let tableViewExcuse: UITableView = {
        let tableview = UITableView(frame: .zero, style: .plain)
        tableview.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.allowsSelection = false
        return tableview
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        addSubviews()
        configConstrainstsTableView()
    }

    private func addSubviews() {
        addSubview(tableViewExcuse)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configConstrainstsTableView() {
        NSLayoutConstraint.activate([
            self.tableViewExcuse.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            self.tableViewExcuse.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            self.tableViewExcuse.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            self.tableViewExcuse.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
