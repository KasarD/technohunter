require 'rails_helper'

describe TrucksController do

    render_views

    describe "GET #index" do
        it "assigns an array of trucks to @trucks" do
            truck = create(:truck)
            get :index
            expect(assigns(:trucks)).to eq([truck])
        end

        it "renders the truck :index view" do
            get :index
            expect(response).to render_template 'trucks/index'
        end
    end

    describe "GET #show" do 
        before (:all) do
            @truck = create(:truck)
        end
        it "assigns requested truck to @vehicle" do
            get :show, id: @truck
            expect(assigns(:vehicle)).to eq(@truck)
        end    
        it "render the truck :show view" do
            get :show, id: @truck
            expect(response).to render_template 'trucks/show'
        end
        it "render the shared/form partial" do
            get :show , id: @truck
            expect(response).to render_template :partial => 'shared/_show_vehicle'
        end
        after(:all) do
            @truck.destroy
        end
    end

    describe "GET #new" do

        it "create new instance of truck with Vehicle parent" do
            expect(described_class).to be < VehiclesController    
        end
        it "assigns new truck instance to @vahicle" do
            get :new
            expect(assigns(:truck).type).to eq("Truck")
        end
        it "render the truck :_form template" do
            get :new
            expect(response).to render_template 'trucks/_form'
        end

    end

    describe "GET #edit" do
        before (:all) do
            @truck = create(:truck)
        end
        it "assigns requested truck to @vehicle" do
            get :edit, id: @truck
            expect(assigns(:vehicle)).to eq(@truck)
        end
        it "render the truck :form template" do
            get :edit, id: @truck
            expect(response).to render_template 'trucks/_form'
        end
        after (:all) do
            @truck.destroy
        end
    end

    describe "POST #create" do
        context "with valid attributes" do
            it "saves the new truck in the database" do
                expect{
                    post :create, truck: attributes_for(:truck)
                }.to change(Truck,:count).by(1)
            end
            it "redirects to the new truck :show view" do
                post :create, truck: attributes_for(:truck)
                expect(response).to redirect_to Truck.last
            end
        end

#        context "with invalid attributes" do
#            it "doesn't save new truck" do
#                expect{
#                    post :create, truck: attributes_for(:invalid_truck)
#                }.to_not change(Truck, :count)
#            end
#            it "renders the vehicle :new template"
#        end
    end

    describe "PUT #update" do
        # TODO: Доделать данный метод (everydayrails.com)
        before(:all) do
            @truck = create(:truck)
        end
        context "with valid attributes" do
            it "locates the requested truck" do
                get :update, id: @truck, truck: attributes_for(:truck)
                expect(assigns(:vehicle)).to eq(@truck)    
            end

            it "change the @truck params" do
                get :update, id: @truck, truck: attributes_for(:truck, vehicle_type: "Фургон")
                @truck.reload
                expect(@truck.vehicle_type).to eq("Фургон")
            end

            it "redirects to the updated @truck" do
                get :update, id: @truck, truck: attributes_for(:truck)
                expect(response).to redirect_to @truck
            end
        end
        after(:all) do
            @truck.destroy
        end
    end

    describe "DELETE #destroy" do
        before (:each) do
            @truck = create(:truck)
        end

        it "deletes truck from database" do
            expect{
                delete :destroy, id: @truck
            }.to change(Truck,:count).by(-1)
        end
        it "redirect to the truck :index template" do
            delete :destroy, id: @truck
            expect(response).to redirect_to trucks_path
        end
    end
end