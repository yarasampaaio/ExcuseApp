//
//  ExcuseUsedViewController.swift
//  ExcuseApp
//
//  Created by Yara Vitoria on 19/10/22.
//

import UIKit

class ExcuseUsedViewController: UIViewController {

    let excuseUsedView = ExcusesUsedView()
    let contentView = ExcusesUsedView()
    let persisteService = PersisteService()    
    override func loadView() {
        self.view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.tableViewExcuse.delegate = self
        contentView.tableViewExcuse.dataSource = self
    
//        title = "navigation"
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//            self.navigationController?.pushViewController(GeratorExcuseViewController(), animated: true)
//        }
        
    }
}
extension ExcuseUsedViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        persisteService.excuseUsadas.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier) as? TableViewCell else { return UITableViewCell() }

        let excuse = persisteService.excuseUsadas[indexPath.row]

        cell.cellExcuse.text = excuse.excuse
        cell.cellExcuse.font = UIFont(name: "OneSlice", size: 23)
        cell.backgroundColor = .clear
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        90
    }
}
