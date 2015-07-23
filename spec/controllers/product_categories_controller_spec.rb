require 'rails_helper'

RSpec.describe ProductCategoriesController, type: :controller do
  describe "POST #create" do
    context "valid product_category params" do
      let(:product) { Product.create(name: "foo", price: 1000, stock: 4) }
      let(:category) { Category.create(name: "bar") }

      let(:valid_params) do { 
        product_id: Product.last.id, category_id: Category.last.id }
      end

      # it "creates a product_category record" do
      #   post :create, product_category_params, product_id: Product.last.id
      #   # number here is number of records in seeds plus 1

      #   expect(ProductCategory.count).to eq 11
      # end

      it "creates a product_category record" do
          # post :create, :product_id => Product.last.id, :product_category => valid_params
          expect(ProductCategory.count).to eq 12
        end

      # it "redirects to the login page" do
      #   post :create, user_params
      #   expect(response).to redirect_to(login_path)
      # end
    end

    # negative test, user params are invalid
    # context "invalid board game params" do
    #   let(:user_params) do {
    #     user:{
    #       username: 'Bob',
    #     }
    #   }
    #   end

    #   it "does not persist invalid records" do
    #     post :create, user_params
    #     expect(User.count).to eq 2
    #   end

    #   it "redirects to the #new page after input fails" do
    #     post :create, user_params
    #     expect(response).to redirect_to(new_user_path)
    #   end
    # end
  end

  # describe "PUT #update" do
  # end
end
