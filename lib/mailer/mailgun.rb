require 'mailer/adaptor'

class Mailer
  class Mailgun < Adaptor

    def self.from
      ENV['MAILGUN_FROM_ADDRESS']
    end

    def self.url
      "https://api.mailgun.net"
    end

    def self.path
      "/v2/form.mailgun.org/messages"
    end

    private

    def params
      {
        'from' => self.class.from,
        'to' => self.to,
        'subject' => self.subject,
        'text' => self.body
      }
    end

    def connection
      @connection ||= Faraday.new(:url => self.class.url) do |faraday|
        faraday.request  :url_encoded
        faraday.request  :basic_auth, 'api', ENV["MAILGUN_KEY"]
        faraday.response :logger
        faraday.adapter  Faraday.default_adapter
      end
    end

  end
end
