require 'rails_helper'
require 'mailer/mailgun'

describe Mailer::Mailgun do
  it_behaves_like "Mailer::Adaptor", Mailer::Mailgun, "Hello from Mailgun!"
end
