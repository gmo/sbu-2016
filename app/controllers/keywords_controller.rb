class KeywordsController < ApplicationController
  before_action :set_keyword, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction

  # GET /keywords
  # GET /keywords.json
  def index
    @keywords = Keyword.order(sort_column + " " + sort_direction)
  end
  
  def arabic
    @keywords = Keyword.order(sort_column + " " + sort_direction)
  end
  
  def chinese
    @keywords = Keyword.order(sort_column + " " + sort_direction)
  end
  
  def english
    @keywords = Keyword.order(sort_column + " " + sort_direction)
  end
  
  def french
    @keywords = Keyword.order(sort_column + " " + sort_direction)
  end
  
  def hindi
    @keywords = Keyword.order(sort_column + " " + sort_direction)
  end
  
  def indonesian
    @keywords = Keyword.order(sort_column + " " + sort_direction)
  end
  
  def portuguese
    @keywords = Keyword.order(sort_column + " " + sort_direction)
  end
  
  def russian
    @keywords = Keyword.order(sort_column + " " + sort_direction)
  end
  
  def spanish
    @keywords = Keyword.order(sort_column + " " + sort_direction)
  end

  # GET /keywords/1
  # GET /keywords/1.json
  def show
  end

  # GET /keywords/new
  def new
    @keyword = Keyword.new
  end

  # GET /keywords/1/edit
  def edit
  end

  # POST /keywords
  # POST /keywords.json
  def create
    @keyword = Keyword.new(keyword_params)

    respond_to do |format|
      if @keyword.save
        format.html { redirect_to @keyword, notice: 'Keyword was successfully created.' }
        format.json { render :show, status: :created, location: @keyword }
      else
        format.html { render :new }
        format.json { render json: @keyword.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /keywords/1
  # PATCH/PUT /keywords/1.json
  def update
    respond_to do |format|
      if @keyword.update(keyword_params)
        format.html { redirect_to @keyword, notice: 'Keyword was successfully updated.' }
        format.json { render :show, status: :ok, location: @keyword }
      else
        format.html { render :edit }
        format.json { render json: @keyword.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /keywords/1
  # DELETE /keywords/1.json
  def destroy
    @keyword.destroy
    respond_to do |format|
      format.html { redirect_to keywords_url, notice: 'Keyword was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_keyword
      @keyword = Keyword.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def keyword_params
      params.require(:keyword).permit(:word, :count, :language)
    end
    
    def sort_column
      Keyword.column_names.include?(params[:sort]) ? params[:sort] : "word"
    end
  
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
