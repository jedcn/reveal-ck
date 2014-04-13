module RevealCK
  module Templates
    #
    # Public: This class is home to a simple algorithm for looking up
    # files in a series of directories. Directory order matters, and the
    # first match for the file will be returned. It'll raise if it can't
    # find the file you've asked for.
    #
    class Finder
      attr_reader :paths

      def initialize(args = {})
        @paths = args[:paths] || default_paths
      end

      def default_paths
        pwd_templates = File.join Dir.pwd, 'templates'
        reveal_ck_templates = File.join RevealCK::LOCATION, 'templates'
        [pwd_templates, reveal_ck_templates]
      end

      def find(template_name)
        paths.each do |path|
          glob_pattern = "#{File.join(path, template_name)}*"
          Dir.glob(glob_pattern).each do |match|
            return match unless File.directory? match
          end
        end
        fail "Unable to find #{template_name} in #{paths}"
      end
    end
  end
end
