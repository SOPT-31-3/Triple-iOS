//
//  TokyoTableViewCell.swift
//  Triple-iOS
//
//  Created by saint on 2022/11/20.
//

import UIKit

class TokyoTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TokyoTableViewCell{
    private func layout() {
        
    }
}
