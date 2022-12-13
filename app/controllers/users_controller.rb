class UsersController < ApplicationController
  before_action :set_user, only: %i[destroy edit show update]
  before_action :authorize_user, only: %i[destroy edit update]
  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'Вы успешно зарегистрировались'
    else
      flash.now[:alert] = "Вы неправильно заполнили поля формы регистрации"
      render :new
    end
  end

  def new
    @user = User.new
  end

  def edit
  end

  def show
    @questions = @user.questions.order(created_at: :desc)
    @question = Question.new(user: @user)
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "Данные пользователя обновлены"
    else
      flash.now[:alert] = "При попытке сохранения пользователя возникла ошибка!"
      render :edit
    end
  end

  def destroy
    @user.destroy

    session.delete(:user_id)

    redirect_to root_path, notice: "Пользователь удалён"
  end

  private

  def user_params
    params.require(:user).permit(
      :name, :nickname, :email, :password, :password_confirmation
    )
  end

  def set_user
    @user = User.find(params[:id])
  end

  def authorize_user
    redirect_with_alert unless current_user == @user
  end
end
