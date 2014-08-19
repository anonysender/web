require 'faraday'

class Mailer
  class Adaptor < Struct.new(:to, :body, :subject)
    attr_reader :response

    def self.from
      ENV["FROM_NAME"]
    end

    def self.email(email_params = { to: nil, body: nil, subject: nil })
      self.new(email_params[:to], email_params[:body], email_params[:subject]).run
    end

    def make_request!
      @response = connection.post(self.class.path, params)
    end

    def run
      make_request!
      success?
    end

    private

    def params
    end

    def success?
      response.success?
    end

    def connection
      @connection ||= Faraday.new(:url => self.class.url) do |faraday|
        faraday.request  :url_encoded
        faraday.response :logger
        faraday.adapter  Faraday.default_adapter
      end
    end

  end
end
