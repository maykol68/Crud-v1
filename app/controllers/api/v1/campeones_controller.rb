module Api 
    module V1 
        #El nombre del controlador debe ser el plural y la clase se debe llamar igual que el controlador.
        #el modulo siempre tiene que comenzar en mayuscula
        class CampeonesController < ApplicationController
            def index
                campeones = Campeon.order('created_at');
                render json: {
                    status: 'Exitoso',
                    message: 'Campeones cargados',
                    data: campeones
                }, status: :ok 
            end
            #metodo para obtener  campeon que queremos usando id
            def show
                campeon = Campeon.find(params[:id])
                render json: {
                    status: 'Exitoso',
                    message: 'campeoon cargados',
                    data: campeon
                }, status: :ok 
            end
            
            def create
                #referencia al modelo
                campeon = Campeon.new(campeon_params) 
                if campeon.save
                    render json: {
                    status: 'Exitoso',
                    message: 'campeon cargados',
                    data: campeon
                }, status: :ok 
                else
                    render json: {
                        status: 'Fallo',
                        message: 'campeon no cargados',
                        data: campeon.errors
                    }, status: :unprocecessable_entity 
                end
            end

            def destroy
                campeon = Campeon.find(params[:id])
                if campeon.destroy
                    render json: {
                    status: 'Exitoso',
                    message: 'campeon eliminado',
                    data: campeon
                }, status: :ok 
                else
                    render json: {
                        status: 'Fallo',
                        message: 'campeon no eliminado',
                        data: campeon.errors
                    }, status: :unprocecessable_entity 
                end
            end

            def update
                campeon = Campeon.find(params[:id])
                #Utilizamos el metodo update_attributes de ruby
                if campeon.update_attributes(campeon_params)
                    render json: {
                        status: 'Exitoso',
                        message: 'campeon eliminado',
                        data: campeon
                    }, status: :ok 

                else
                    render json: {
                        status: 'Falló',
                        message: 'campeon no actualizado',
                        data: campeon.errros
                    }, status: :unprocessable_entity
                end
            end
            #parametros que queremos  que se  utilicen ara el create
            private
            #tienen que ser los mismos parametros que definimos como required
            def campeon_params
                params.permit(:nombre, :region, :rol, :comp)
            end
        end
    end
end