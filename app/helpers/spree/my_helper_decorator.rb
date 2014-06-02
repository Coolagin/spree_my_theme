#coding: utf-8
def my_taxons_tree(root_taxon, current_taxon, max_level = 1)
  return '' if max_level < 1 || root_taxon.children.empty?
  content_tag :ul, :class => 'dropdown-menu' do
    root_taxon.children.map do |taxon|
      css_class = (current_taxon && current_taxon.self_and_ancestors.include?(taxon)) ? 'current' : nil
      content_tag :li, :class => css_class do
        link_to(taxon.name, seo_url(taxon)) +
        taxons_tree(taxon, current_taxon, max_level - 1)
      end
    end.join("\n").html_safe
  end
end

def get_vendor(product)
  result =''
  product.taxons.each do |taxon|
    result = taxon if taxon.taxonomy.eql?(Spree::Taxonomy.find_by_name('Производители'))
  end
  return result
end

def link_product_full_name(product)
  s = ""
  s << link_to(product.name, product, :class => 'info', :itemprop => "name")
  s<< "<strong>"
  s<< link_to(get_vendor(product).name, seo_url(get_vendor(product)))
  s<< "</strong> "
  s<<"( "
  s<<product.sku
  s<< " )"
  s.html_safe
end

def product_full_name(product)
  s = ""
  s << product.name
  s<< "<strong>"
  s<< get_vendor(product).name
  s<< "</strong> "
  s<<"( "
  s<<product.sku
  s<< " )"
  s.html_safe
end

def per_page_filter(*args)
  s = ""
  s << "<div class='btn-group' data-toggle='buttons-radio'>"
  args.each do |lnk|
    uri = request.path
    s<<"<a type='button' class='btn btn-default #{"active" if params[:per_page].eql?(lnk)}' href="+uri+"?per_page="+lnk+">"+lnk+"</a>"
  end
  s << "</div>"
  s.html_safe
end

def sort_botton(args)
  s=""
  s<<"<select id='sort_panel'>"
  args.each do |key,val|
    s<<"<option>#{args[key]}</option>"
  end
  s<<"</select>"
  s.html_safe
end
