module RevealCK
  # Retrieve the value of a symbol from a hash or fail
  module Retrieve
    def retrieve(symbol, hash)
      hash[symbol] || fail("#{symbol} is required")
    end

    def self.included(base)
      base.extend(Retrieve)
    end
  end
end
