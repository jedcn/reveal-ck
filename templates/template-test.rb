require 'reveal-ck'

processor = RevealCK::TemplateProcessor.open '/Users/jnorthridge/c/personal/reveal-ck/templates/title.slim'

variables = {
  title: 'Reveal.js',
  subtitle: 'HTML Presentations Made Easy',
  author: 'Hakim El Hattab',
  site: 'http://hakim.se',
  twitter: 'hakimel'
}
puts processor.output({}, variables)
