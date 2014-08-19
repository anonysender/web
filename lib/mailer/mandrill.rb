require 'mailer/adaptor'
require 'json'

class Mailer
  class Mandrill < Adaptor

    def self.url
      "https://mandrillapp.com/api/1.0/"
    end

    def self.path
      "/api/1.0/messages/send.json"
    end

    def self.from_address
      ENV["MANDRILL_FROM_ADDRESS"]
    end

    private

    def success?
      JSON.parse(response.body).first["status"] == "sent"
    end

    def params
      {
        'key' => ENV["MANDRILL_KEY"],
        'message' => {
          'text' => self.body,
          'subject' => self.subject,
          'from_email' => self.class.from_address,
          'from_name' => self.class.from,
          'to' => [
            {
              'email' => self.to,
              'name'  => self.to
            }
          ]
        }
      }
    end

  end
end
