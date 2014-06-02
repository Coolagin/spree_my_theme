# encoding: UTF-8;
Deface::Override.new(:virtual_path => "layouts/spree_application", 
                     :name => "footer-left", 
                     :replace_contents => "#footer-left", 
                     :text => "<div class='txt'>&copy;ООО &laquo;Термоарт&raquo; 2011&#151;2012. Все права защищены. Указанная стоимость товаров и условия их приобретения действительны по состоянию на текущую дату</div>")

											