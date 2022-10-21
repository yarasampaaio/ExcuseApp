import UIKit

protocol GeratorExcuseDelegate: AnyObject {
    func callApi()
    func persiste()
}

class GeratorExcuseViewController: UIViewController {

    var allExcuse: [ExcuseModel] = []
    var curentExcused: ExcuseModel?

    let geratorExcuseView = GeratorExcuseView()
    let persisteService = PersisteService()

    override func loadView() {
        self.view = geratorExcuseView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        geratorExcuseView.delegate = self
        geratorExcuseView.nextPageUsed = {
            self.buttonNextPageUsed()
        }
    }

    func findExcuse() -> ExcuseModel? {
        guard let escolhida = allExcuse.randomElement() else { return nil }
        return escolhida
    }
    
    private func buttonNextPageUsed() {
        self.navigationController?.pushViewController(ExcuseUsedViewController(), animated: true)
    }
}

extension GeratorExcuseViewController: GeratorExcuseDelegate {
    func persiste() {
        if let excuse = curentExcused {
            persisteService.persisteExcuse(excuse: excuse)
        }
    }
    
    func callApi() {
        Task {
            allExcuse = try await GetService.getExcuses()
            let excuseRandom = findExcuse()
            curentExcused = excuseRandom
            geratorExcuseView.excuseLabel.text = excuseRandom?.excuse
        }
    }
}
