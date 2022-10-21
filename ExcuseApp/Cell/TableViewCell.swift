//
//  TableViewCell.swift
//  ExcuseApp
//
//  Created by Yara Vitoria on 19/10/22.
//

import UIKit

class TableViewCell: UITableViewCell {
    static var identifier = "TableViewCell"

    var cellExcuse: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        configConstrainstsTableViewCell()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addSubviews() {
        self.contentView.addSubview(cellExcuse)
    }

    private func configConstrainstsTableViewCell() {
        NSLayoutConstraint.activate([
            cellExcuse.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            cellExcuse.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 12),
            cellExcuse.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            cellExcuse.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 8)
        ])
    }

}
