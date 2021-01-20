//
//  AppDetailHeaderView.swift
//
import UIKit

class AppDetailVersionDetailsView: UIView {
    
    private(set) lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.numberOfLines = 1
        return label
    }()
    
    private(set) lazy var versionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 14.0)
        return label
    }()
    
    private(set) lazy var changesTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textColor = .black
        textView.font = UIFont.systemFont(ofSize: 14.0)
        textView.isScrollEnabled = true
        textView.isEditable = false
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setUI() {
        self.addSubview(titleLabel)
        self.addSubview(versionLabel)
        self.addSubview(changesTextView)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 12.0),
            titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16.0),
            titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16.0),
            
            versionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12.0),
            versionLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor),
            versionLabel.rightAnchor.constraint(equalTo: titleLabel.rightAnchor),
            
            changesTextView.topAnchor.constraint(equalTo: versionLabel.bottomAnchor, constant: 12.0),
            changesTextView.leftAnchor.constraint(equalTo: versionLabel.leftAnchor),
            changesTextView.rightAnchor.constraint(equalTo: versionLabel.rightAnchor),
            changesTextView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 16.0)
        ])
        
    }
}
