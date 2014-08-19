require 'rails_helper'
require 'mailer/mandrill'

describe Mailer::Mandrill do
  it_behaves_like "Mailer::Adaptor", Mailer::Mandrill, "Hello from Mandrill!"
end
