//
//  Rectangle Button.swift
//  Learning App
//
//  Created by Uday Sidhu on 03/02/23.
//

import SwiftUI

struct RectangleButton: View {
    var color = Color.white
    var height = 48.0
    var body: some View {
        Rectangle().frame(height: height).cornerRadius(5).foregroundColor(color).shadow(radius: 5)
        
    }
}

struct RectangleButton_Previews: PreviewProvider {
    static var previews: some View {
        RectangleButton()
    }
}
