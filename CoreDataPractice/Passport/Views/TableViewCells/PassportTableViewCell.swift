//
//  PassportTableViewCell.swift
//  CoreDataPractice
//
//  Created by Honey Maheshwari TaskHuman on 22/05/24.
//

import UIKit

class PassportTableViewCell: UITableViewCell {

    @IBOutlet private weak var passportNumberLabel: UILabel!
    @IBOutlet private weak var placeOfIssueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func populatePassportDate(_ passport: Passport) {
        passportNumberLabel.text = "Passport No: " + passport.passportId
        placeOfIssueLabel.text = "Place: " + passport.placeOfIssue
    }

}
