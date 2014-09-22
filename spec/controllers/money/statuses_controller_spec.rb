require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe Money::StatusesController, :type => :controller do

  # This should return the minimal set of attributes required to create a valid
  # Money::Status. As you add validations to Money::Status, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # Money::StatusesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all money_statuses as @money_statuses" do
      money_status = Money::Status.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:money_statuses)).to eq([money_status])
    end
  end

  describe "GET show" do
    it "assigns the requested money_status as @money_status" do
      money_status = Money::Status.create! valid_attributes
      get :show, {:id => money_status.to_param}, valid_session
      expect(assigns(:money_status)).to eq(money_status)
    end
  end

  describe "GET new" do
    it "assigns a new money_status as @money_status" do
      get :new, {}, valid_session
      expect(assigns(:money_status)).to be_a_new(Money::Status)
    end
  end

  describe "GET edit" do
    it "assigns the requested money_status as @money_status" do
      money_status = Money::Status.create! valid_attributes
      get :edit, {:id => money_status.to_param}, valid_session
      expect(assigns(:money_status)).to eq(money_status)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Money::Status" do
        expect {
          post :create, {:money_status => valid_attributes}, valid_session
        }.to change(Money::Status, :count).by(1)
      end

      it "assigns a newly created money_status as @money_status" do
        post :create, {:money_status => valid_attributes}, valid_session
        expect(assigns(:money_status)).to be_a(Money::Status)
        expect(assigns(:money_status)).to be_persisted
      end

      it "redirects to the created money_status" do
        post :create, {:money_status => valid_attributes}, valid_session
        expect(response).to redirect_to(Money::Status.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved money_status as @money_status" do
        post :create, {:money_status => invalid_attributes}, valid_session
        expect(assigns(:money_status)).to be_a_new(Money::Status)
      end

      it "re-renders the 'new' template" do
        post :create, {:money_status => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested money_status" do
        money_status = Money::Status.create! valid_attributes
        put :update, {:id => money_status.to_param, :money_status => new_attributes}, valid_session
        money_status.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested money_status as @money_status" do
        money_status = Money::Status.create! valid_attributes
        put :update, {:id => money_status.to_param, :money_status => valid_attributes}, valid_session
        expect(assigns(:money_status)).to eq(money_status)
      end

      it "redirects to the money_status" do
        money_status = Money::Status.create! valid_attributes
        put :update, {:id => money_status.to_param, :money_status => valid_attributes}, valid_session
        expect(response).to redirect_to(money_status)
      end
    end

    describe "with invalid params" do
      it "assigns the money_status as @money_status" do
        money_status = Money::Status.create! valid_attributes
        put :update, {:id => money_status.to_param, :money_status => invalid_attributes}, valid_session
        expect(assigns(:money_status)).to eq(money_status)
      end

      it "re-renders the 'edit' template" do
        money_status = Money::Status.create! valid_attributes
        put :update, {:id => money_status.to_param, :money_status => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested money_status" do
      money_status = Money::Status.create! valid_attributes
      expect {
        delete :destroy, {:id => money_status.to_param}, valid_session
      }.to change(Money::Status, :count).by(-1)
    end

    it "redirects to the money_statuses list" do
      money_status = Money::Status.create! valid_attributes
      delete :destroy, {:id => money_status.to_param}, valid_session
      expect(response).to redirect_to(money_statuses_url)
    end
  end

end
