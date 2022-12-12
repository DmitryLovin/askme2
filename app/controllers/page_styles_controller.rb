class PageStylesController < ApplicationController
  def edit
  end

  def update
    form_params = params.require(:style)
    session[:navbar_color] = form_params[:color]

    flash.now[:notice] = "Цвет панели успешно сохранён!"
    render :edit
  end
end
