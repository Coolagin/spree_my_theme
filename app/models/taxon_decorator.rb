#coding: utf-8
Spree::Taxon.class_eval do

  scope :get_cat_products, where(:name=>"Категории")


  def self.get_vendors(limit=nil)
    self.find_by_name("Производители")
  end

  def applicable_filters
    fs=[]
    fs << Spree::ProductFiltersDecorator.selective_brand_filter(self) if Spree::ProductFiltersDecorator.respond_to?(:selective_brand_filter)
    # fs << ProductFilters.brand_filter if ProductFilters.respond_to?(:brand_filter)
    fs
  end
end