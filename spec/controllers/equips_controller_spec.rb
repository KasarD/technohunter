require 'rails_helper'

describe EquipsController do
  render_views

  describe 'GET #index' do
    it 'assigns an array of equips to @equips' do
      equip = create(:equip)
      get :index
      expect(assigns(:equips)).to eq([equip])
    end

    it 'renders the equip :index view' do
      get :index
      expect(response).to render_template 'equips/index'
    end
  end

  describe 'GET #show' do
    before (:all) do
      @equip = create(:equip)
    end
    it 'assigns requested equip to @vehicle' do
      get :show, id: @equip
      expect(assigns(:vehicle)).to eq(@equip)
    end
    it 'render the equip :show view' do
      get :show, id: @equip
      expect(response).to render_template 'equips/show'
    end
    it 'render the shared/form partial' do
      get :show, id: @equip
      expect(response).to render_template partial: 'shared/_show_vehicle'
    end
    after(:all) do
      @equip.destroy
    end
  end

  describe 'GET #new' do
    it 'create new instance of equip with Vehicle parent' do
      expect(described_class).to be < VehiclesController
    end
    it 'assigns new equip instance to @vahicle' do
      get :new
      expect(assigns(:equip).type).to eq('Equip')
    end
    it 'render the equip :_form template' do
      get :new
      expect(response).to render_template 'equips/_form'
    end
  end

  describe 'GET #edit' do
    before (:all) do
      @equip = create(:equip)
    end
    it 'assigns requested equip to @vehicle' do
      get :edit, id: @equip
      expect(assigns(:vehicle)).to eq(@equip)
    end
    it 'render the equip :form template' do
      get :edit, id: @equip
      expect(response).to render_template 'equips/_form'
    end
    after (:all) do
      @equip.destroy
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'saves the new equip in the database' do
        expect do
          post :create, equip: attributes_for(:equip)
        end.to change(Equip, :count).by(1)
      end
      it 'redirects to the new equip :show view' do
        post :create, equip: attributes_for(:equip)
        expect(response).to redirect_to Equip.last
      end
    end

    #        context "with invalid attributes" do
    #            it "doesn't save new equip" do
    #                expect{
    #                    post :create, equip: attributes_for(:invalid_equip)
    #                }.to_not change(Equip, :count)
    #            end
    #            it "renders the vehicle :new template"
    #        end
  end

  describe 'PUT #update' do
    # TODO: Доделать данный метод (everydayrails.com)
    before(:all) do
      @equip = create(:equip)
    end
    context 'with valid attributes' do
      it 'locates the requested equip' do
        get :update, id: @equip, equip: attributes_for(:equip)
        expect(assigns(:vehicle)).to eq(@equip)
      end

      it 'change the @equip params' do
        get :update, id: @equip, equip: attributes_for(:equip, vehicle_type: 'Лесопилка')
        @equip.reload
        expect(@equip.vehicle_type).to eq('Лесопилка')
      end

      it 'redirects to the updated @equip' do
        get :update, id: @equip, equip: attributes_for(:equip)
        expect(response).to redirect_to @equip
      end
    end
    after(:all) do
      @equip.destroy
    end
  end

  describe 'DELETE #destroy' do
    before (:each) do
      @equip = create(:equip)
    end

    it 'deletes equip from database' do
      expect do
        delete :destroy, id: @equip
      end.to change(Equip, :count).by(-1)
    end
    it 'redirect to the equip :index template' do
      delete :destroy, id: @equip
      expect(response).to redirect_to equips_path
    end
  end
end
