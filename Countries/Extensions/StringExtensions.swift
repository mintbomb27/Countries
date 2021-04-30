//
//  StringExtensions.swift
//  Countries
//
//  Created by Alok N on 30/04/21.
//
extension String{
    var flagFromCode: String{
            var string = ""
            for char in self.unicodeScalars{
                if char != "_"{
                    guard let uni = UnicodeScalar(127397 + char.value) else {return ""}
                    string.unicodeScalars.append(uni)
                }
            }
            return string
        }
}
