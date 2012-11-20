Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '361676400593065', 'd89043313020b9d3c1d1c4b4678530c2',
           :scope => 'email,user_birthday,read_stream,create_note', :display => 'popup'
end

