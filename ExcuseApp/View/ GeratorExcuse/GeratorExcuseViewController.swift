import UIKit

protocol GeratorExcuseDelegate: AnyObject {
    func callApi()
}

class GeratorExcuseViewController: UIViewController {

    var allExcuse: [ExcuseModel] = []

    let geratorExcuseView = GeratorExcuseView()

    override func loadView() {
        self.view = geratorExcuseView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        geratorExcuseView.delegate = self
    }

    func findExcuse() -> ExcuseModel? {
        guard let escolhida = allExcuse.randomElement() else { return nil }
        return escolhida
    }
}

extension GeratorExcuseViewController: GeratorExcuseDelegate {
    func callApi() {
        Task {
            allExcuse = try await GetService.getExcuses()
            let excuseRandom = findExcuse()
            geratorExcuseView.excuseLabel.text = excuseRandom?.excuse
        }
    }
}

//extension GeratorExcuseViewController: ContentViewDelegate {
//
//    func contentView(_ geratorExcuseView: GeratorExcuseView, didTapOnButton button: UIButton) {
//        Task {
//            allExcuse = try await GetService.getExcuses()
//            self.view.addSubview(self.excuseLabel)
//            self.configConstrainsts()
//        }
//    }
//}
