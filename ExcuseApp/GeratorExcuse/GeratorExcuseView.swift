import UIKit

class GeratorExcuseView: UIView {

    weak var delegate: GeratorExcuseDelegate?
    var nextPageUsed: (() -> Void)?
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
    lazy var buttonNextPage: UIButton = {
         let buttonNextPage = UIButton(type: .system)
        buttonNextPage.setTitle("Used ones", for: .normal)
        buttonNextPage.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        buttonNextPage.setTitleColor(.white, for: .normal)
        buttonNextPage.layer.borderColor = UIColor.systemGray2.cgColor
        buttonNextPage.backgroundColor = .systemGray2
        buttonNextPage.layer.borderWidth = 4
        buttonNextPage.clipsToBounds = true
        buttonNextPage.layer.cornerRadius = 10
        buttonNextPage.translatesAutoresizingMaskIntoConstraints = false
        buttonNextPage.addTarget(self, action: #selector(self.tappedButtonNextPage), for: .touchUpInside)
         return buttonNextPage
     }()
    lazy var buttonSave: UIButton = {
         let buttonSave = UIButton(type: .system)
        buttonSave.setTitle("Save", for: .normal)
        buttonSave.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        buttonSave.setTitleColor(.white, for: .normal)
        buttonSave.layer.borderColor = UIColor.systemGreen.cgColor
        buttonSave.backgroundColor = .systemGreen
        buttonSave.layer.borderWidth = 4
        buttonSave.clipsToBounds = true
        buttonSave.layer.cornerRadius = 10
        buttonSave.translatesAutoresizingMaskIntoConstraints = false
        buttonSave.addTarget(self, action: #selector(self.tappedButtonSave), for: .touchUpInside)
         return buttonSave
     }()
    let backgroundImage: UIImageView = {
        let backgroundImage = UIImageView()
        backgroundImage.image = UIImage(named: "background")
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        return backgroundImage
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        addSubviews()
        configConstrainsts()
        configConstrainstsButton()
        configConstrainstsBackground()
        configConstrainstsButtonNextPage()
        configConstrainstsButtonSave()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configConstrainsts() {
        NSLayoutConstraint.activate([
            self.excuseLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.excuseLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor,constant: 160),
            self.excuseLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
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
    private func configConstrainstsButtonNextPage() {
        NSLayoutConstraint.activate([
            self.buttonNextPage.topAnchor.constraint(equalTo: self.buttonSave.bottomAnchor, constant: 16),
            self.buttonNextPage.centerXAnchor.constraint(equalTo: self.buttonSave.centerXAnchor),
            self.buttonNextPage.widthAnchor.constraint(equalToConstant: 150),
            self.buttonNextPage.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    private func configConstrainstsButtonSave() {
        NSLayoutConstraint.activate([
            self.buttonSave.topAnchor.constraint(equalTo: self.button.bottomAnchor, constant: 16),
            self.buttonSave.centerXAnchor.constraint(equalTo: self.button.centerXAnchor),
            self.buttonSave.widthAnchor.constraint(equalToConstant: 150),
            self.buttonSave.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    func configConstrainstsBackground() {
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            backgroundImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            backgroundImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            backgroundImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0)
        ])
    }

    private func addSubviews() {
        addSubview(backgroundImage)
        addSubview(excuseLabel)
        addSubview(button)
        addSubview(buttonNextPage)
        addSubview(buttonSave)
    }

    @objc
    func tappedButton() {
        delegate?.callApi()
    }
    @objc
    func tappedButtonNextPage() {
        nextPageUsed?()
    }
    @objc
    func tappedButtonSave() {
        delegate?.persiste()
    }
}
