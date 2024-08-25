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

import Testing
@testable import RomanNumerals

@Test func toInt() async throws {
  #expect(2000 == RomanNumeral.toInt("MM"))
  #expect(1000 == RomanNumeral.toInt("M"))
  #expect(1900 == RomanNumeral.toInt("MCM"))
  #expect(1910 == RomanNumeral.toInt("MDCCCCX"))
  #expect(8 == RomanNumeral.toInt("IIX"))
  #expect(28 == RomanNumeral.toInt("XXIIX"))

  #expect(nil == RomanNumeral.toInt("foo"))
}

@Test func toRoman() async throws {
  #expect("MM" == RomanNumeral.toRoman(2000))
  #expect("MMCDXXI" == RomanNumeral.toRoman(2421))
  #expect("MDCCLXXVI" == RomanNumeral.toRoman(1776))
  #expect("MCMXVIII" == RomanNumeral.toRoman(1918))
  #expect("MCMXLIV" == RomanNumeral.toRoman(1944))
  #expect("MMXXIV" == RomanNumeral.toRoman(2024))
}
