//
//  HighlightedView.swift
//  OpenWeather
//
//  Created by Dre on 08.07.17.
//  Copyright © 2017 Dre. All rights reserved.
//

import UIKit

class HighlightedView: UIView {
    
    @IBInspectable var highlightColor = UIColor.owHighlight
    private var originalBackgroundColor: UIColor?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        originalBackgroundColor = backgroundColor
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        selectView()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        deselectView()
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        deselectView()
    }
    
    private func selectView() {
        backgroundColor = highlightColor
    }
    
    private func deselectView() {
        UIView.animate(withDuration: 0.4) {
            self.backgroundColor = self.originalBackgroundColor
        }
    }
    
}
