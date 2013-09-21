module RevealCK
  #
  # Public: A FileStringReplacer knows how to replace one string
  # in a file with another.
  #
  class FileStringReplacer

    def self.replace!(file, args)
      old, new = args[:old], args[:new]
      lines = File.open(file).read
      lines = lines.sub old, new
      File.open(file, 'w') { |file| file << lines }
    end

  end
end
