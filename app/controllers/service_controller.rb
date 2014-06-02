module Spree
  class ServiceController < Spree::BaseController
    
    def get_products
    	@products = Spree::Product.all

    	respond_to do |format|
    		format.html {render :layout=>false}
    	end
    end
  end
end
