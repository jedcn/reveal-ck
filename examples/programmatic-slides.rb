require_relative '../lib/reveal-ck'

title_slide =
  RevealCK::Slide.new({
                        template: 'title',
                        title:    'Reveal.js',
                        subtitle: 'HTML Presentations Made Easy',
                        author:   'Hakim El Hattab',
                        site:     'http://hakim.se',
                        twitter:  'hakimel'
                      })

quote_slide =
  RevealCK::Slide.new({
                        template: 'quote',
                        headline: 'Clever Quotes',
                        quote:    'For years there has been a theory that millions of monkeys typing at random on millions of typewriters would reproduce the entire works of Shakespeare. The Internet has proven this theory to be untrue.'
                      })

image_slide =
  RevealCK::Slide.new({
                        template: 'image',
                        src:      'http://s3.amazonaws.com/hakim-static/portfolio/images/meny.png',
                        alt:      'Meny',
                        link:     'http://lab.hakim.se/meny/',
                        width:    '320',
                        height:   '299',
                      })


sample_code = <<eos
function linkify( selector ) {
  if( supports3DTransforms ) {
    var nodes = document.querySelectorAll( selector );
    for( var i = 0, len = nodes.length; i &lt; len; i++ ) {
      var node = nodes[i];
      if( !node.className ) {
        node.className += ' roll';
      }
    }
  }
}
eos

code_slide =
  RevealCK::Slide.new({
                        template: 'code',
                        headline: 'Pretty Code',
                        code: sample_code
                      })

p = RevealCK::Presentation.new
p.add_slide title_slide
p.add_slide quote_slide
p.add_slide image_slide
p.add_slide code_slide

puts p.content
