require_relative '../lib/reveal-ck'

intro_slide =
  RevealCK::Slide.new(
    template: 'intro',
    title:    'Reveal.js',
    subtitle: 'HTML Presentations Made Easy',
    author:   'Hakim El Hattab',
    link:     'http://hakim.se',
    twitter:  'hakimel'
  )
quote_content = <<eos
For years there has been a theory that millions of monkeys typing at
random on millions of typewriters would reproduce the entire works of
Shakespeare. The Internet has proven this theory to be untrue.
eos

quote_slide =
  RevealCK::Slide.new(
    template: 'quote',
    headline: 'Clever Quotes',
    content:  quote_content
  )

meny_png_url = 'http://s3.amazonaws.com/hakim-static/portfolio/images/meny.png'
image_slide =
  RevealCK::Slide.new(
    template: 'image',
    src:      meny_png_url,
    alt:      'Meny',
    link:     'http://lab.hakim.se/meny/',
    width:    '320',
    height:   '299'
  )

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
  RevealCK::Slide.new(
    template: 'code',
    headline: 'Pretty Code',
    content:  sample_code
  )

p = RevealCK::Presentation.new config: RevealCK::Config.new
p.add intro_slide
p.add quote_slide
p.add image_slide
p.add code_slide

puts p.html
