Deface::Override.new(:virtual_path => "spree/shared/_head",

:name => "add_bootstrap_to_header",

:insert_after => "title",

:text =>

"<%= javascript_include_tag 'jquery' %>
<%= javascript_include_tag 'bootstrap' %>")