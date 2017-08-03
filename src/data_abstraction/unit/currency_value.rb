module DataAbstraction::Unit
  class CurrencyValue < Generic
    STANDARD_UNIT = "JPY"
    UNITS = [
             [ "GBP", "GBP", "gbp", "Pound", "pound" ],
             [ "ILS", "ILS", "ils" ],
             [ "INR", "INR", "inl" ],
             [ "IDR", "IDR", "idr" ],
             [ "AUD", "AUD", "aud" ],
             [ "CAD", "CAD", "cad" ],
             [ "SGD", "SGD", "sgd" ],
             [ "CHF", "CHF", "chf" ],
             [" SEK", "SEK", "sek" ],
             [ "THB", "THB", "thb" ],
             [ "CZK", "CZK", "czk" ],
             [ "CLP", "CLP", "clp" ],
             [ "DKK", "DKK", "dkk" ],
             [ "TRY", "TRY", "try" ],
             [ "NZD", "NZD", "nzd" ],
             [ "NOK", "NOK", "nok" ],
             [ "PKR", "PKR", "pkr" ],
             [ "HUF", "HUF", "huf" ],
             [ "PHP", "PHP", "php" ],
             [ "BRL", "BRL", "brl" ],
             [ "PLN", "PLN", "pln" ],
             [ "MYR", "MYR", "myr" ],
             [ "MXN", "MXN", "mxn" ],
             [ "EUR", "EUR", "eur", "Euro", "euro" ],
             [ "RUB", "RUB", "rub" ],
             [ "CNY", "CNY", "cny" ],
             [ "ZAR", "ZAR", "zar" ],
             [ "TWD", "TWD", "twd" ],
             [ "JPY", "JPY", "jpy", "Yen", "yen" ],
             [ "USD", "USD", "usd", "Doller", "doller" ],
             [ "KRW", "KRW", "krw", "Won", "won" ],
             [ "HKD", "HKD", "hkd" ]
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
