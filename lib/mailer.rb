require 'mailer/mailgun'
require 'mailer/mandrill'

class Mailer
  MAILER_SOURCES = [Mailer::Mailgun, Mailer::Mandrill].freeze unless defined?(MAILER_SOURCES)

  def self.email!(email_params = { to: nil, body: nil, subject: nil })
    new.email(email_params.with_indifferent_access)
  end

  def email(email_params)
    mailer.email(email_params) || fallback_mailer.email(email_params)
  end

  def mailer
    @mailer ||= MAILER_SOURCES.sample
  end

  def fallback_mailer
    @fallback_mailer ||= MAILER_SOURCES.reject { |source| mailer == source }.sample
  end

end
