# Configure Spree Preferences
#
# Note: Initializing preferences available within the Admin will overwrite any changes that were made through the user interface when you restart.
#       If you would like users to be able to update a setting with the Admin it should NOT be set here.
#
# In order to initialize a setting do:
# config.setting_name = 'new value'
Spree.config do |config|
	 #config.show_zero_stock_products = false # Default is true
  # Example:
  # Uncomment to stop tracking inventory levels in the application
  # config.track_inventory_levels = false

  Paperclip::Attachment.default_options[:s3_protocol] = "https"
Spree::Image.attachment_definitions[:attachment][:styles] = ActiveSupport::JSON.decode('{"mini":"48x48\u003E","small":"175x175\u003E","product":"240x240\u003E","large":"600x600\u003E"}').symbolize_keys!
Spree::Image.attachment_definitions[:attachment][:path] = " /#{Rails.env}/:id/:style/:basename.:extension"
Spree::Image.attachment_definitions[:attachment][:url] = '/spree/products/:id/:style/:basename.:extension'
Spree::Image.attachment_definitions[:attachment][:default_url] = ''
Spree::Image.attachment_definitions[:attachment][:default_style] = 'product'



end

  Paperclip.interpolates(:s3_eu_url) do |attachment, style|
  "#{attachment.s3_protocol}://#{Spree::Config[:s3_host_alias]}/#{attachment.bucket_name}/#{attachment.path(style).gsub(%r{^/}, "")}"
end


Spree.user_class = "Spree::User"



