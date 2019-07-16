class AdminsBackoffice::RoomsController < AdminsBackofficeController
    before_action :set_room, only: [:edit, :update, :destroy]

    def index
        @q = Room.ransack(params[:q])
        @rooms = @q.result(distinct: true).page(params[:page])
    end

    def edit  
    end

    def new
        @room = Room.new
    end

    def create
        @room = Room.new(params_room)
        if @room.save
            redirect_to admins_backoffice_rooms_path,
            notice: "Sala criada com sucesso"
        else
            render :new
        end   
    end
    
    def update
        if @room.update(params_room)
            redirect_to admins_backoffice_rooms_path,
            notice: "Sala atualizada com sucesso"
        else
            render :edit
        end    	
    end

    def destroy
        if @room.destroy
            redirect_to admins_backoffice_rooms_path,
            notice: "Sala excluida com sucesso"
        else
            render :index
        end
    end

    private

    def params_room
        params.require(:room).permit(:name, :location, :capacity)
    end  

    def set_room
        @room = Room.find(params[:id])
    end

end
