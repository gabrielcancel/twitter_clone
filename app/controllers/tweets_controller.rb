class TweetsController < ApplicationController
  before_action :set_tweet, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :check_right, only: [:destroy]

  # GET /tweets or /tweets.json
  def index
    @tweets = Tweet.all.order("created_at DESC")
  end

  def search
    @searchtweets = Tweet.where("text LIKE ?", "%#{params[:search]}%")
  end
  # GET /tweets/1 or /tweets/1.json
  def show
  end

  # GET /tweets/new
  def new
    @tweet = Tweet.new
  end

  # GET /tweets/1/edit
  def edit
  end

  # POST /tweets or /tweets.json
  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id
    respond_to do |format|
      if @tweet.save
        find_generate_hashtag
        format.html { redirect_to tweet_url(@tweet)}
        format.json { render :show, status: :created, location: @tweet }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tweets/1 or /tweets/1.json
  def update
    respond_to do |format|
      if @tweet.update(tweet_params)
        format.html { redirect_to tweet_url(@tweet)}
        format.json { render :show, status: :ok, location: @tweet }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tweets/1 or /tweets/1.json
  def destroy
    @tweet.destroy

    respond_to do |format|
      format.html { redirect_to tweets_url}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tweet_params
      params.require(:tweet).permit(:message, :search)
    end

    def find_generate_hashtag
      @tweet.message.scan(/#\w+/).each do |hashtag|
      hashtag = hashtag.strip
      hashtag ["#"] = ''
      current_hashtag = HashTag.find_or_create_by(name: hashtag)
      @tweet.hash_tags << current_hashtag
      end
    end

    def check_right
      if current_user.id != @tweet.user_id
        redirect_to tweets_url, notice: "You can't delete other user's tweets"
      end
    end
        
end

