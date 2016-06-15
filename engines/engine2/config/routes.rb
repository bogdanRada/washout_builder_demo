Namespace::Engine2::Engine.routes.draw do
  scope '/soap_api' do
    wash_out :engine2, module: "Namespace::Engine2"
  end
end
