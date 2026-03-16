module RevealCK
  # Enables easy filtering of an HTML string through an html-pipeline.
  class FilteredHtmlString
    include Retrieve
    attr_reader :html, :pipeline

    def initialize(args)
      @html = retrieve(:html, args)
      @pipeline = retrieve(:pipeline, args)
    end

    def render
      apply_pipeline(pipeline).to_s
    end

    private

    def apply_pipeline(pipeline)
      result = pipeline.call(html)
      result[:output]
    end
  end
end
