class HashTagsController < ApplicationController
  def show
    @hash_tag = HashTag.find_by!(text: params[:text])
    @questions = @hash_tag.questions
  end
end
