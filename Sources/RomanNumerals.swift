//
// SPDX-License-Identifier: Apache-2.0
//
// Copyright 2023 Mattias Holm
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

import Foundation

public struct RomanNumeral {
  // TODO: Handle: Apostrophus, and Vinculum for large numbers
  // TODO: Should zero result in the string NULLA?
  // TODO: What about numbers larger than 3999?
  static let I = 1, V = 5, X = 10, L = 50, C = 100, D = 500, M = 1000
  static let weightTable = [Character("I") : 1, Character("V") : 5, Character("X") : 10, Character("L") : 50, Character("C") : 100, Character("D"): 500, Character("M"): 1000]

  /// Convert a roman numeral string to integer
  ///
  /// The function accepts numbers greater than zero and is case insensitive.
  ///
  /// When converting a string to a roman numeral to an int, the conversion may fail.
  /// On failures such as invalid characters, the convesion returns nil.
  public static func toInt(_ s: String) -> Int? {
    var result = 0
    var currentWeight = 0

    for character in s.uppercased().reversed() {
      guard let weight = weightTable[character] else {
        return nil
      }
      if weight < currentWeight {
        result -= weight
      } else {
        result += weight
        currentWeight = weight
      }
    }

    return result
  }

  /// Convert an integer to a roman number string
  ///
  /// Conversion of roman numerals is valid in the range [1, 3999],
  /// numbers outside that range result in nil.
  public static func toRoman<I: BinaryInteger>(_ i: I) -> String? {
    if i > 3999 || i <= 0 {
      return nil
    }
    let thousandsTable = ["", "M", "MM", "MMM"]
    let hunderedsTable = ["", "C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM"]
    let tensTable = ["", "X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC"]
    let onesTable = ["", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"]
    var result = ""

    let ii = [String].Index(clamping: i)

    let thousands = ii / 1000
    let hundereds = ii / 100 % 10
    let tens = ii / 10 % 10
    let ones = ii % 10

    result.append(thousandsTable[thousands])
    result.append(hunderedsTable[hundereds])
    result.append(tensTable[tens])
    result.append(onesTable[ones])

    return result
  }
}
