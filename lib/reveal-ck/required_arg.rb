module RevealCK
  #
  # Classes that include this module get access to required_arg
  #
  module RequiredArg
    def required_arg(args, symbol)
      args[symbol] || fail("#{symbol} is required")
    end

    def retrieve(symbol, hash)
      hash[symbol] || fail("#{symbol} is required")
    end
  end
end
