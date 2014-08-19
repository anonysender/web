require 'spec_helper'

RSpec.shared_examples_for "Mailer::Adaptor" do |klass, subject|
  let(:email)   { "jarred@jarredsumner.com" }
  let(:email_params) do
    {
      :to      => email,
      :subject => subject,
      :body    => SecureRandom.urlsafe_base64,
    }
  end

  describe ".email" do

    context "given valid params" do
      it "succeeds" do
        expect(klass.email(email_params)).to eq(true)
      end
    end

    context "given an invalid email" do
      it "fails" do
        params = email_params.merge(:to => "invalid-email")
        expect(klass.email(params)).to eq(false)
      end
    end

  end

  describe "#run" do
    let(:mailer) do
      klass.new(email, SecureRandom.urlsafe_base64, subject)
    end

    it "succeeds" do
      expect(mailer.run).to eq(true)
    end

    it "with invalid email, fails" do
      mailer.to = "blah"
      expect(mailer.run).to eq(false)
    end

  end

end
