import UIKit

class GeratorExcuseView: UIView {

    weak var delegate: GeratorExcuseDelegate?

    lazy var excuseLabel: UILabel = {
        let frase = UILabel()
        frase.translatesAutoresizingMaskIntoConstraints = false
        frase.text = "Excuse"
        frase.font = UIFont.boldSystemFont(ofSize: 35)
        frase.textColor = .systemBlue
        frase.textAlignment = .center
        frase.numberOfLines = 0
        return frase
    }()

   lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("New excuse", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        button.setTitleColor(.white, for: .normal)
        button.layer.borderColor = UIColor.systemBlue.cgColor
       button.backgroundColor = .systemBlue
        button.layer.borderWidth = 4
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(self.tappedButton), for: .touchUpInside)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        addSubviews()
        configConstrainsts()
        configConstrainstsButton()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configConstrainsts() {
        NSLayoutConstraint.activate([
            self.excuseLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.excuseLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.excuseLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 20),
            self.excuseLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])
    }
    private func configConstrainstsButton() {
        NSLayoutConstraint.activate([
            self.button.topAnchor.constraint(equalTo: self.excuseLabel.bottomAnchor, constant: 16),
            self.button.centerXAnchor.constraint(equalTo: self.excuseLabel.centerXAnchor),
            self.button.widthAnchor.constraint(equalToConstant: 150),
            self.button.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    private func addSubviews() {
        addSubview(excuseLabel)
        addSubview(button)
    }

    @objc
    func tappedButton() {
        delegate?.callApi()
    }
}
