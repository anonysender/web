require 'rails_helper'
require 'mailer'

describe Mailer do

  context ".email!" do

    context "given valid params" do

      let(:email_params) do
        {
          :to => "jarred@jarredsumner.com",
          :body => SecureRandom.urlsafe_base64,
          :subject => "Hai! This is a test email!"
        }
      end

      it "sends email successfully" do
        expect(Mailer.email!(email_params)).to eq(true)
      end

      context "when one mailer fails" do
        let(:mailer)  { Mailer.new }
        let(:adaptor) { Mailer::Adaptor.new }

        before :each do
          allow(adaptor).to receive(:email).and_return(false)
          allow(mailer).to  receive(:mailer).and_return(adaptor)
        end

        it "falls back to a different mailer" do
          expect(mailer.fallback_mailer).to_not eq(mailer.mailer)
        end

        it "still emails successfully" do
          expect(mailer.email(email_params)).to eq(true)
        end

      end

    end
    context "given invalid params" do

      it "fails" do
        expect(Mailer.email!).to eq(false)
      end

    end
  end

end
