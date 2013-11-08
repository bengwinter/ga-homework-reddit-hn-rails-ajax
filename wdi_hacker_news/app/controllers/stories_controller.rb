class StoriesController < ApplicationController
  before_action :set_story, only: [:show, :edit, :update, :destroy]

  def index
    @user = User.new
    @stories = Story.all
  end

  # post '/posts/create' do
  #   Story.create(title: params[:title], link: params[:link], body: params[:body]).to_json
  # end

  # get '/posts/:id' do
  #   Story.find(params[:id]).to_json 
  # end
  def new
    @story = Story.new
  end

  def list_stories 
    Story.all.to_json
  end

  def create
    @story = Story.new(story_params)

    respond_to do |format|
      if @story.save
        format.html { redirect_to @story, notice: 'Song was successfully created.' }
        format.json { render action: 'show', status: :created, location: @story }
        format.js
      else
        format.html { render action: 'new' }
        format.json { render json: @story.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def upvote

  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_story
    @story = Story.find(params[:id])
  end

    # Never trust parameters from the scary internet, only allow the white list through.
  def story_params
      params.require(:story).permit(:title, :url, :body)
  end
end
