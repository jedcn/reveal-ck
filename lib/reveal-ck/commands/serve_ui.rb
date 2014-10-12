module RevealCK
  module Commands
    # This object represents controls the "User Interface" of the
    # serve command.
    class ServeUI
      PREFIXES = {
        default: '[ reveal-ck ]',
        problem: '[  problem  ]',
        rebuild: '[  rebuild  ]',
        reload:  '[   reload  ]'
      }

      def problem(general_problem, specific_error)
        blank :problem
        message general_problem, :problem
        blank :problem
        message specific_error, :problem
        blank :problem
      end

      def message(s, type = nil)
        prefix = prefix_for(type)
        puts "#{prefix} #{s}"
      end

      def prefix_for(type = nil)
        PREFIXES[type] || PREFIXES[:default]
      end

      def blank(type = nil)
        prefix = PREFIXES[type] || ''
        puts "#{prefix}"
      end

      def separator
        puts '------------------------------------------------------------'
      end
    end
  end
end
