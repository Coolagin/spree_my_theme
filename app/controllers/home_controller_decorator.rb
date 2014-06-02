#encoding: UTF-8;
Spree::HomeController.class_eval do
  	layout "spree/layouts/spree_home"
    
  	def index
  		@taxonomy = Spree::Taxonomy.find{|t| t.name.eql?('Категории')}
  		@taxon=@taxonomy.root
  	end

  	def about_us
  		
  	end

  	def contacts
  		
  	end

    def otzyvy
      
    end
    
    def certificates
      
    end

end
