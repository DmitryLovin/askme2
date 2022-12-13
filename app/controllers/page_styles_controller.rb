class PageStylesController < ApplicationController
  def edit
  end

  def update
    form_params = params.require(:style)
    session[:navbar_color] = form_params[:color]
    
    redirect_to edit_page_style_path, notice: "Цвет панели успешно сохранён!"
  end
end
