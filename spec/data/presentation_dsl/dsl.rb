presentation do

  title 'Presentation Title'
  author 'Presentation Author'
  theme 'night'
  transition 'page'
  revealjs_config 'autoSlide', 5000

  slide 'text',
        content: 'Hello World'

  slide 'code',
        content: contents_of('lib/reveal-ck.rb')

  slide 'text',
        content: 'Thanks!'

end
