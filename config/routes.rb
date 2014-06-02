Spree::Core::Engine.routes.draw do
  # Add your extension routes here
  match "/about_us"=>"home#about_us", :as => :about_us
  match "/contacts"=>"home#contacts", :as => :contacts
  match "/otzyvy"=>"home#otzyvy", :as => :otzyvy
  match "/certificates"=>"home#certificates", :as => :certificates
  match '/vendors'=> "vendors#index"

  # scope :service do
	match "service/get_products"=> "service#get_products", as: :get_products
  # end
  

end
