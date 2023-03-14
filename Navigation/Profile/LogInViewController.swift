//
//  LogInViewController.swift
//  Navigation
//
//  Created by Юзер on 27.02.2023.
//

import UIKit

class LogInViewController: UIViewController {
    // MARK: - Constants & variables
    private let logo: UIImageView = {
        let logo = UIImageView(image: UIImage(named: "logo"))
        logo.translatesAutoresizingMaskIntoConstraints = false
        return logo
    }()
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    private let vStack: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .fillProportionally
        stack.layer.borderWidth = 0.5
        stack.layer.borderColor = UIColor.lightGray.cgColor
        stack.layer.cornerRadius = 10
        stack.spacing = 0
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var mailPhoneText: UITextField = {
        let mailPhoneText = UITextField()
        mailPhoneText.placeholder = "Email or phone"
        mailPhoneText.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        mailPhoneText.leftViewMode = .always
        mailPhoneText.textColor = .black
        mailPhoneText.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        mailPhoneText.backgroundColor = .systemGray6
        mailPhoneText.autocapitalizationType = .none
        mailPhoneText.autocorrectionType = .no
        mailPhoneText.returnKeyType = .next
        mailPhoneText.keyboardType = .default
        mailPhoneText.delegate = self
        mailPhoneText.tag = 0
        return mailPhoneText
    }()
    
    private lazy var passwordText: UITextField = {
        let passwordText = UITextField()
        passwordText.placeholder = "Password"
        passwordText.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        passwordText.leftViewMode = .always
        passwordText.isSecureTextEntry = true
        passwordText.textColor = .black
        passwordText.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        passwordText.backgroundColor = .systemGray6
        passwordText.autocapitalizationType = .none
        passwordText.autocorrectionType = .no
        passwordText.returnKeyType = .done
        passwordText.keyboardType = .default
        passwordText.delegate = self
        passwordText.tag = 1
        return passwordText
    }()
    
    private let divider: UIView = {
        let borderForStack = UIView()
        borderForStack.layer.borderWidth = 0.5
        borderForStack.layer.borderColor = UIColor.lightGray.cgColor
        borderForStack.translatesAutoresizingMaskIntoConstraints = false
        return borderForStack
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log In", for: .normal)
        button.backgroundColor = UIColor(patternImage: UIImage(named: "blue_pixel")!)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // MARK: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setupUI()
        setupConstraints()
        onTapToHideKeyboard()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupKeyboardObservers()
        addLoginButtonAction()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        removeKeyboardObservers()
    }
    
    private func addSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(logo)
        contentView.addSubview(vStack)
        vStack.addArrangedSubview(mailPhoneText)
        vStack.addArrangedSubview(divider)
        vStack.addArrangedSubview(passwordText)
        view.addSubview(loginButton)
        
    }
    
    private func setupUI() {
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .white
    }
    
    private func setupConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 0),
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            scrollView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -100),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            contentView.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),

            logo.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            logo.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logo.widthAnchor.constraint(equalToConstant: 100),
            logo.heightAnchor.constraint(equalToConstant: 100),
           
            vStack.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 120),
            vStack.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            vStack.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            vStack.heightAnchor.constraint(equalToConstant: 100),

            divider.heightAnchor.constraint(equalToConstant: 1),
            
            loginButton.topAnchor.constraint(equalTo: vStack.bottomAnchor, constant: 16),
            loginButton.leftAnchor.constraint(equalTo: safeArea.leftAnchor, constant: 16),
            loginButton.rightAnchor.constraint(equalTo: safeArea.rightAnchor, constant: -16),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    func setupKeyboardObservers() {
        let notificationCenter = NotificationCenter.default
        
        notificationCenter.addObserver(
            self,
            selector: #selector(self.willShowKeyboard(_:)),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        
        notificationCenter.addObserver(
            self,
            selector: #selector(self.willHideKeyboard(_:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
    
    func removeKeyboardObservers() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.removeObserver(self)
    }
    
    func addLoginButtonAction() {
        loginButton.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
    }
    
    @objc func loginButtonPressed() {
        let nextController = ProfileViewController()
        navigationController?.pushViewController(nextController, animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let nextTag = textField.tag + 1
        let nextResponder = textField.superview?.viewWithTag(nextTag) as? UIResponder
        if nextResponder != nil {
            nextResponder?.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return false
    }
}

// MARK: - Extensions
extension LogInViewController: UITextFieldDelegate {
    private func onTapToHideKeyboard() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tap)

    }
    
    @objc func hideKeyboard() {
        self.vStack.arrangedSubviews.forEach { subview in
            if subview.isFirstResponder {
                subview.resignFirstResponder()
                resetScrollViewInsetBottom()
            }
        }
    }
    
    func resetScrollViewInsetBottom() {
        scrollView.contentInset.bottom = 0
    }
    
    @objc func willShowKeyboard(_ notification: NSNotification) {
        let keyboardHeigth = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height
        
        let diff = view.bounds.height - (keyboardHeigth ?? 0) - loginButton.frame.maxY
        if diff < 0 {
            scrollView.contentInset.bottom = 0 - diff
        }
    }
    
    @objc func willHideKeyboard(_ notification: NSNotification) {
        resetScrollViewInsetBottom()
    }
}
