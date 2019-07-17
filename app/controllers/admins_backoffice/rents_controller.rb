class AdminsBackoffice::RentsController < AdminsBackofficeController
    before_action :set_rent, only: [:edit, :update, :destroy]

    def index
        @rents = Rent.all.page(params[:page])
    end

    def edit  
    end

    def new
        @rent = Rent.new
    end

    def create
        @rent = Rent.new(params_rent)
        if @rent.save
            redirect_to admins_backoffice_rents_path,
            notice: "Aluguél criado com sucesso"
        else
            render :new
        end   
    end
    
    def update
        if @rent.update(params_rent)
            redirect_to admins_backoffice_rents_path,
            notice: "Aluguél atualizado com sucesso"
        else
            render :edit
        end    	
    end

    def destroy
        if @rent.destroy
            redirect_to admins_backoffice_rents_path,
            notice: "Aluguél excluido com sucesso"
        else
            render :index
        end
    end

    private

    def params_rent
        params.require(:rent).permit(:hour, :rental_date, :description, :room_id)
    end  

    def set_rent
        @rent = Rent.find(params[:id])
    end    
end
