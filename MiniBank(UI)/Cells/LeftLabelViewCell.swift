//
//  LeftLabelViewCell.swift
//  MiniBank(UI)
//
//  Created by Punhan Shahmurov on 13.08.25.
//

import UIKit

class LeftLabelViewCell: UICollectionViewCell {

    @IBOutlet private weak var label: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(value: String) {
        label.text = value
    }
}
