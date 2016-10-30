require 'rails_helper'

describe CarsController do

    render_views

    describe "GET #index" do
        it "assigns an array of cars to @cars" do
            car = create(:car)
            get :index
            expect(assigns(:cars)).to eq([car])
        end

        it "renders the car :index view" do
            get :index
            expect(response).to render_template 'cars/index'
        end
    end

    describe "GET #show" do 
        before (:all) do
            @car = create(:car)
        end
        it "assigns requested car to @vehicle" do
            get :show, id: @car
            expect(assigns(:vehicle)).to eq(@car)
        end    
        it "render the car :show view" do
            get :show, id: @car
            expect(response).to render_template 'cars/show'
        end
        it "render the shared/form partial" do
            get :show , id: @car
            expect(response).to render_template :partial => 'shared/_show_vehicle'
        end
        after(:all) do
            @car.destroy
        end
    end

    describe "GET #new" do

        it "create new instance of Car with Vehicle parent" do
            expect(described_class).to be < VehiclesController    
        end
        it "assigns new car instance to @vahicle" do
            get :new
            expect(assigns(:car).type).to eq("Car")
        end
        it "render the car :_form template" do
            get :new
            expect(response).to render_template 'cars/_form'
        end

    end

    describe "GET #edit" do
        before (:all) do
            @car = create(:car)
        end
        it "assigns requested car to @vehicle" do
            get :edit, id: @car
            expect(assigns(:vehicle)).to eq(@car)
        end
        it "render the car :form template" do
            get :edit, id: @car
            expect(response).to render_template 'cars/_form'
        end
        after (:all) do
            @car.destroy
        end
    end

    describe "POST #create" do
        context "with valid attributes" do
            it "saves the new car in the database" do
                expect{
                    post :create, car: attributes_for(:car)
                }.to change(Car,:count).by(1)
            end
            it "redirects to the new car :show view" do
                post :create, car: attributes_for(:car)
                expect(response).to redirect_to Car.last
            end
        end

#        context "with invalid attributes" do
#            it "doesn't save new car" do
#                expect{
#                    post :create, car: attributes_for(:invalid_car)
#                }.to_not change(Car, :count)
#            end
#            it "renders the vehicle :new template"
#        end
    end

    describe "PUT #update" do
        # TODO: Доделать данный метод (everydayrails.com)
        before(:all) do
            @car = create(:car)
        end
        context "with valid attributes" do
            it "locates the requested car" do
                get :update, id: @car, car: attributes_for(:car)
                expect(assigns(:vehicle)).to eq(@car)    
            end

            it "change the @car params" do
                get :update, id: @car, car: attributes_for(:car, vehicle_type: "Фургон")
                @car.reload
                expect(@car.vehicle_type).to eq("Фургон")
            end

            it "redirects to the updated @car" do
                get :update, id: @car, car: attributes_for(:car)
                expect(response).to redirect_to @car
            end
        end
        after(:all) do
            @car.destroy
        end
    end

    describe "DELETE #destroy" do
        before (:each) do
            @car = create(:car)
        end

        it "deletes car from database" do
            expect{
                delete :destroy, id: @car
            }.to change(Car,:count).by(-1)
        end
        it "redirect to the car :index template" do
            delete :destroy, id: @car
            expect(response).to redirect_to cars_path
        end
    end
end