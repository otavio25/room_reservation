class AdminsBackoffice::UsersController < AdminsBackofficeController
  before_action :set_user, only: [:edit, :update, :destroy]
  before_action :verify_password, only: [:update]

  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true).page(params[:page])
  end

  def edit
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params_user)
    if @user.save
      redirect_to admins_backoffice_users_index_path,
      notice: "Usuário cadastrado com sucesso"
    else
      render :new
    end   
  end
  
  def update
    if @user.update(params_user)
      redirect_to admins_backoffice_users_index_path,
      notice: "Usuário atualizado com sucesso"
    else
      render :edit
    end    	
  end

  def destroy
    if @user.destroy
      redirect_to admins_backoffice_users_index_path,
      notice: "Usuário excluido com sucesso"
    else
      render :index
    end
  end

  private

  def params_user
    params.require(:user).permit(:email, :password, :password_confirmation)
  end  

  def set_user
    @user = User.find(params[:id])
  end

  def verify_password
    if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
        params[:user].extract!(:password, :password_confirmation)
    end
  end
end
