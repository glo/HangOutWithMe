OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "551098618268547", "7a705cec855a4e4266761ec58f07243a",
           :scope => 'email', :display => 'popup'
end