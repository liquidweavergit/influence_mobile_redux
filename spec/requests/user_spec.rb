require 'rails_helper'

RSpec.describe "Users", type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:admin_user) { FactoryBot.create(:user, admin: true) }

  describe "GET /index" do
    it "redirects logged out users" do
      get users_path
      expect(response).to have_http_status(302)
    end

    it "redirects non-admin users" do
      sign_in(user)
      get users_path
      expect(response).to have_http_status(302)
    end

    it "returns 200 for logged in admin users" do
      sign_in(admin_user)
      get users_path
      expect(response).to have_http_status(200)
    end
  end

  describe "Create user" do
    it "redirects non-admin users" do
      sign_in(user)
      get new_user_path
      expect(response).to have_http_status(302)
    end

    it "new user form, submit, create user" do
      sign_in(admin_user)

      get new_user_path
      assert_template 'users/new'

      post users_path, params: {
          user: FactoryBot.build(:user).as_json.merge( password: 'password', password_confirmation: 'password' )
      }
      expect(response).to have_http_status(302)
      expect(response.media_type).to eq("text/html")
      expect(response.content_type).to eq("text/html; charset=utf-8")
      expect(User.all.count).to eq(2)
    end
  end

  describe "Show user" do
    it "redirects non-admin users" do
      new_user = FactoryBot.create(:user)

      sign_in(user)

      get user_path(new_user.id)
      expect(response).to have_http_status(302)
    end

    it "shows user to admins" do
      new_user = FactoryBot.create(:user)

      sign_in(admin_user)

      get user_path(new_user.id)

      expect(response).to have_http_status(200)
      expect(response.media_type).to eq("text/html")
      expect(response.content_type).to eq("text/html; charset=utf-8")
    end
  end

  describe "Edit user" do
    it "redirects non-admin users" do
      new_user = FactoryBot.create(:user)

      sign_in(user)

      get edit_user_path(new_user.id)

      expect(response).to have_http_status(302)
      expect(User.all.count).to eq(2)
    end

    it "edits users" do
      new_user = FactoryBot.create(:user)

      sign_in(admin_user)

      get edit_user_path(new_user.id)
      assert_template 'users/edit'

      patch user_path, params: {
          user: { first_name: 'new_first_name' }
      }
      expect(response).to have_http_status(302)
      expect(response.media_type).to eq("text/html")
      expect(response.content_type).to eq("text/html; charset=utf-8")
      expect(User.find(new_user.id).first_name).to eq('new_first_name')
    end
  end

  describe "Delete user" do
    it "redirects non-admin users" do
      new_user = FactoryBot.create(:user)

      sign_in(user)

      delete user_path(new_user.id)

      expect(response).to have_http_status(302)
      expect(User.all.count).to eq(2)

      new_user.destroy!
    end

    it "deletes users for admin" do
      new_user = FactoryBot.create(:user)

      sign_in(admin_user)

      delete user_path(new_user.id)

      expect(response).to have_http_status(302)
      expect(response.media_type).to eq("text/html")
      expect(response.content_type).to eq("text/html; charset=utf-8")
      expect(User.all.count).to eq(1)
    end
  end
end
