module DataAbstraction::Unit
  class CurrencyValue < Generic
    STANDARD_UNIT = "JPY"
    UNITS = [
             [ "AUD", "AUD", "aud" ],
             [ "BDT", "BDT", "bdt" ],
             [ "BND", "BND", "bnd" ],
             [ "BRL", "BRL", "brl", "real" ],
             [ "CAD", "CAD", "cad" ],
             [ "CFP", "CFP", "cfp" ],
             [ "CHF", "CHF", "chf" ],
             [ "CLP", "CLP", "clp" ],
             [ "CNY", "CNY", "cny", "RMB", "rmb" ],
             [ "CZK", "CZK", "czk" ],
             [ "DKK", "DKK", "dkk" ],
             [ "EUR", "EUR", "eur", "Euro", "euro" ],
             [ "FJD", "FJD", "fjd" ],
             [ "GBP", "GBP", "gbp", "Pound", "pound" ],
             [ "HKD", "HKD", "hkd", "HK$" ],
             [ "HUF", "HUF", "huf", "forint" ],
             [ "IDR", "IDR", "idr" ],
             [ "ILS", "ILS", "ils" ],
             [ "INR", "INR", "inl" ],
             [ "JPY", "JPY", "jpy", "Yen", "yen" ],
             [ "KHR", "KHR", "khr" ],
             [ "KRW", "KRW", "krw", "Won", "won" ],
             [ "LAK", "LAK", "lak" ],
             [ "LKR", "LKR", "lkr" ],
             [ "MMK", "MMK", "mmk" ],
             [ "MOP", "MOP", "mop" ],
             [ "MXN", "MXN", "mxn", "Mex$" ],
             [ "MYR", "MYR", "myr", "RM", "rm", "Ringgit" ],
             [ "NOK", "NOK", "nok" ],
             [ "NPR", "NPR", "npr" ],
             [ "NZD", "NZD", "nzd" ],
             [ "PHP", "PHP", "php" ],
             [ "PKR", "PKR", "pkr" ],
             [ "PLN", "PLN", "pln", "zloty" ],
             [ "RUB", "RUB", "rub", "RUR", "rur", "rouble", "ruble" ],
             [ "SCR", "SCR", "scr" ],
             [ "SEK", "SEK", "sek" ],
             [ "SGD", "SGD", "sgd" ],
             [ "THB", "THB", "thb" ],
             [ "TRY", "TRY", "try" ],
             [ "TWD", "TWD", "twd", "NT$"  ],
             [ "USD", "USD", "usd", "Doller", "doller" ],
             [ "VND", "VND", "vnd" ],
             [ "ZAR", "ZAR", "zar", "Rand", "rand" ],
            ]
    @@unit_table = unit_table(UNITS)

    def initialize(value, unit = STANDARD_UNIT)
      unit = STANDARD_UNIT if ( !unit )
      if  ( @@unit_table[unit] )
        @value = value
        @unit = unit
      else
        raise RangeError, "invalid unit '#{unit}'"
      end
    end
    def self.standard_unit
      STANDARD_UNIT
    end
    def standard_unit
      STANDARD_UNIT
    end
    def self.units
      UNITS
    end
    def to_standard
      self
    end
    def to_requested(unit = STANDARD_UNIT)
      self
    end
  end
end
