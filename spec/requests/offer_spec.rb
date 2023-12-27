require 'rails_helper'

RSpec.describe "Offers", type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:admin_user) { FactoryBot.create(:user, admin: true) }

  describe "GET /index" do
    it "redirects logged out users" do
      get offers_path
      expect(response).to have_http_status(302)
    end

    it "returns 200 for logged in admin users" do
      sign_in(user)

      get offers_path

      expect(response).to have_http_status(200)
    end

    it "returns 200 for logged in admin users" do
      sign_in(admin_user)

      get offers_path

      expect(response).to have_http_status(200)
    end
  end

  describe "Create offer" do
    it "redirects non-admin users" do
      sign_in(user)

      get new_offer_path

      expect(response).to have_http_status(302)
    end

    it "new offer form, submit, create user" do
      sign_in(admin_user)

      get new_offer_path
      assert_template 'offers/new'

      post offers_path, params: {
          offer: FactoryBot.build(:offer).as_json
      }
      expect(response).to have_http_status(302)
      expect(response.media_type).to eq("text/html")
      expect(response.content_type).to eq("text/html; charset=utf-8")
      expect(Offer.count).to eq(1)
    end
  end

  describe "Show offer" do
    it "shows offer to admins" do
      offer = FactoryBot.create(:offer)

      sign_in(admin_user)

      get offer_path(offer.id)

      expect(response).to have_http_status(200)
      expect(response.media_type).to eq("text/html")
      expect(response.content_type).to eq("text/html; charset=utf-8")
    end
  end

  describe "Edit offer" do
    it "redirects non-admin users" do
      sign_in(user)

      user = FactoryBot.create(:user)

      get edit_offer_path(user.id)

      expect(response).to have_http_status(302)
    end

    it "edits offers" do
      sign_in(admin_user)

      offer = FactoryBot.create(:offer)

      get edit_offer_path(offer.id)

      assert_template 'offers/edit'

      patch offer_path, params: {
          offer: { title: 'new_title' }
      }

      expect(response).to have_http_status(302)
      expect(response.media_type).to eq("text/html")
      expect(response.content_type).to eq("text/html; charset=utf-8")
      expect(Offer.find(offer.id).title).to eq('new_title')
    end
  end

  describe "Delete offer" do
    it "failure for non-admins" do
      sign_in(user)

      offer = FactoryBot.create(:offer)

      delete offer_path(offer.id)

      expect(response).to have_http_status(302)
      expect(Offer.count).to eq(1)

      offer.destroy!
    end

    it "success for admins" do
      sign_in(admin_user)

      offer = FactoryBot.create(:offer)

      delete offer_path(offer.id)

      expect(response).to have_http_status(302)
      expect(response.media_type).to eq("text/html")
      expect(response.content_type).to eq("text/html; charset=utf-8")
      expect(Offer.all.count).to eq(0)
    end
  end
end
