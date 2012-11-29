Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '361676400593065', 'd89043313020b9d3c1d1c4b4678530c2',
           :scope => 'email,user_birthday,read_stream,create_note', :display => 'popup'
  provider :linkedin, "2nmn1vbprfxz", "IpyZTDybPZJ87mzH", :scope => 'r_fullprofile r_emailaddress r_network', :fields => ["id", "email-address", "first-name", "last-name", "headline", "industry", "picture-url", "public-profile-url", "location", "connections"]
end

