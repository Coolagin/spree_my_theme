Spree::TaxonsController.class_eval do

  def show
    @taxon = Spree::Taxon.find_by_permalink!(params[:id])
    return unless @taxon

    if params[:sort] 
    	session[:sort] = params[:sort]
    else
    	session[:sort] = 'name'
    end
    @searcher = Spree::Config.searcher_class.new(params.merge(:taxon => @taxon.id, order_by: 'sku'))
    @products = @searcher.retrieve_products

    respond_with(@taxon) do |format|
    	format.html
    	format.js
    end
  end

end
