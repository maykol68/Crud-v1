Rails.application.routes.draw do
  #routes for my api
  namespace 'api' do
    namespace 'v1' do 
        resources :campeones #se accede a la ruta /api/v1/campeones
      end
  end
end
