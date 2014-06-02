#encoding: UTF-8;
module Spree
  class VendorsController < Spree::BaseController
    
    def index
		@vendors=Spree::Taxon.find_by_name("Производители")
  		@taxonomy = Spree::Taxonomy.find{|t| t.name.eql?('Категории')}
  		@taxon=@taxonomy.root
    end
  end
end
