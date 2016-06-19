Namespace::MyEngine2::Engine.routes.draw do
  scope '/soap_api' do
    wash_out :test_engine2
  end
end
