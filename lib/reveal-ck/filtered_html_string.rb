module RevealCK
  # Enables easy filtering of an HTML string through an html-pipeline.
  class FilteredHtmlString
    include Retrieve
    attr_reader :html, :pipeline, :config

    def initialize(args)
      @html = retrieve(:html, args)
      @pipeline = retrieve(:pipeline, args)
      @config = retrieve(:config, args)
    end

    def render
      apply_pipeline(pipeline, config).to_s
    end

    private

    def apply_pipeline(pipeline, config)
      result = pipeline.call(html, config)
      result[:output]
    end
  end
end
