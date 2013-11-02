presentation do

  title      'Presentation Title'
  author     'Presentation Author'
  theme      'night'
  transition 'page'

  slide 'text',
        content: 'Hello World'

  slide 'code',
        content: contents_of('lib/reveal-ck.rb')

  slide 'text',
        content: 'Thanks!'

end
