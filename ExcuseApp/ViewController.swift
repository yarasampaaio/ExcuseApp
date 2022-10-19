//
//  ViewController.swift
//  ExcuseApp
//
//  Created by Yara Vitoria on 18/10/22.
//

import UIKit

class ViewController: UIViewController {
    var allExcuse: [ExcuseModel] = []
    var excuseUsadas: [ExcuseModel]?
    var excuseCaptadas: [ExcuseModel] = []
    
    lazy var excuseLabel: UILabel = {
        let frase = UILabel()
        frase.translatesAutoresizingMaskIntoConstraints = false
        frase.text = self.findExcuse()?.excuse
        frase.font = UIFont.boldSystemFont(ofSize: 35)
        frase.textColor = .red
        frase.textAlignment = .center
        frase.numberOfLines = 0
        return frase
    }()
    
//    var button: UIButton {
//        let button = UIButton(type: .system)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.setTitle("New excuse", for: .normal)
//        button.titleLabel?.font = UIFont.systemFont(ofSize: 25)
//        button.setTitleColor(.blue, for: .normal)
//        button.layer.borderColor = UIColor.blue.cgColor
//        button.layer.borderWidth = 4
//        button.clipsToBounds = true
//        button.layer.cornerRadius = 10
//        button.addTarget(self, action: #selector(self.tappedButton(sender:)), for: touchUpInside)
//        return button
//    }
//    @objc func tappedButton(sender:UIButton){
//        Task {
//            allExcuse = try await GetService.getExcuses()
//        }
        func findExcuse() -> ExcuseModel? {
            guard let escolhida = allExcuse.randomElement() else { return nil }
            //        var excuseEscolhida = escolhida.excuse
            //        print(excuseEscolhida)
            return escolhida
        }
        func persisteExcuse() {
            guard let escolhida = findExcuse() else { return }
            excuseUsadas?.append(escolhida)
            do {
                var data = try JSONEncoder().encode(excuseUsadas)
                let url = getDocumentsDirectory().appendingPathComponent("excuse.txt")
                try data.write(to: url)
                let input = try String(contentsOf: url)
                print(input)
                print(url)
            } catch {
                print(error.localizedDescription)
            }
        }
        //        print(excuseEscolhida)
        //            print(url)
        func pesquiseArquivo() {
            do {
                let url = getDocumentsDirectory().appendingPathComponent("excuse.txt")
                let data = try Data(contentsOf: url)
                var excuses = try JSONDecoder().decode([ExcuseModel].self, from: data)
                print(excuses)
                //            try data2.write(to: excuseCaptadas)
            } catch {
                print(error.localizedDescription)
            }
        }
        func getDocumentsDirectory() -> URL {
            // find all possible documents directories for this user
            let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
            // just send back the first one, which ought to be the only one
            return paths[0]
        }
        func confereExcuse() -> [ExcuseModel] {
            let result = allExcuse.filter { excuse in
                !excuseCaptadas.contains(excuse)
            }
            return result
        }
        override func viewDidLoad() {
            self.view.backgroundColor = .white
            Task {
                allExcuse = try await GetService.getExcuses()
                self.view.addSubview(self.excuseLabel)
                self.configConstrainsts()
            }
            super.viewDidLoad()
        }
        
        func configConstrainsts() {
            NSLayoutConstraint.activate([
                self.excuseLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                self.excuseLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
                self.excuseLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 20),
                self.excuseLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20)
            ])
        }
    }
