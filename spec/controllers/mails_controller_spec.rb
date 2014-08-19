require 'rails_helper'

describe MailsController, :type => :controller do

  context "POST #create" do

    context "with valid params" do
      let(:email_params) do
        {
          'to'   => "jarred@jarredsumner.com",
          'subject' => "Hai!",
          'body' => "Hey, this is a test email."
        }
      end

      it "succeeds" do
        post :create, email_params
        expect(response).to be_successful

        success = JSON.parse(response.body)["success"]
        expect(success).to eq(true)
      end
    end

  end

  context "with invalid params" do

    it "fails" do
      post :create, 'to' => "bagel"
      expect(response).to_not be_successful

      success = JSON.parse(response.body)['success']
      expect(success).to eq(false)
    end
    
  end

end
