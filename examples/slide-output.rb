require_relative '../lib/reveal-ck'

slide = RevealCK::Slide.new template: 'title',
                            title: 'Here we go!',
                            author: 'Jed Northridge',
                            link: 'http://jedcn.com',
                            twitter: 'jedcn',
                            notes: 'These notes are on the title screen!'
puts slide.html
