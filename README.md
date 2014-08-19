## Anonysender

This is for Uber's coding challenge. Anonysender sends email through Mailgun or Mandrill, falling back if one fails. It's written in Ruby on Rails and Backbone.

### Installation

Before beginning, ensure you have Ruby 2.0 or greater and Bundler installed.

Install the dependencies:

$ ```bundle install```

Run the server:

$ ```bundle exec rails s```

Make sure that you have set all the keys in the `.env.sample`, or it will be unable to send email!

### Files to look at

The non-boilerplate code:

- [./app/assets/javascripts/application.js](app/assets/javascripts/application.js)
- [./app/assets/stylesheets/application.css.scss](app/assets/stylesheets/application.css.scss)
- [./app/controllers/mails_controller.rb](app/controllers/mails_controller.rb)
- [./app/views/mails/new.html.erb](app/views/mails/new.html.erb)
- [./lib/mailer.rb](lib/mailer.rb)
- [./lib/mailer/adaptor.rb](lib/mailer/adaptor.rb)
- [./lib/mailer/mailgun.rb](lib/mailer/mailgun.rb)
- [./lib/mailer/mandrill.rb](lib/mailer/mandrill.rb)

The specs are:

- [./spec/lib/mailer_spec.rb](spec/lib/mailer_spec.rb)
- [./spec/lib/mailer/mailgun_spec.rb](spec/lib/mailer/mailgun_spec.rb)
- [./spec/lib/mailer/mandrill_spec.rb](spec/lib/mailer/mandrill_spec.r)
- [./spec/support/mailer_adaptor_examples.rb](spec/support/mailer_adaptor_examples.rb)
- [./spec/controllers/mails_controller_spec.rb](spec/controllers/mails_controller_spec.rb)
