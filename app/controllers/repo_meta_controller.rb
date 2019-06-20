class RepoMetaController < ApplicationController
  skip_forgery_protection :only => [:create]

  before_action :set_repo_metum, only: [:show, :edit, :update, :destroy]

  # GET /repo_meta
  # GET /repo_meta.json
  def index
    @repo_meta = RepoMetum.all
  end

  # GET /repo_meta/1
  # GET /repo_meta/1.json
  def show
  end

  # GET /repo_meta/new
  def new
    @repo_metum = RepoMetum.new
  end

  # GET /repo_meta/1/edit
  def edit
  end

  # POST /repo_meta
  # POST /repo_meta.json
  def create
    @repo_metum = RepoMetum.findByRepo(current_user.id, params[:repo_metum][:repo_id])
    if !@repo_metum
      @repo_metum = RepoMetum.new(repo_metum_params) # 没有则创建
    else
      @repo_metum.update(repo_metum_params) # 存在则更新
    end
    respond_to do |format|
      if @repo_metum.save
        format.html { redirect_to @repo_metum, notice: 'Repo metum was successfully created.' }
        format.json { render :show, status: :created, location: @repo_metum }
      else
        format.html { render :new }
        format.json { render json: @repo_metum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /repo_meta/1
  # PATCH/PUT /repo_meta/1.json
  def update
    respond_to do |format|
      if @repo_metum.update(repo_metum_params)
        format.html { redirect_to @repo_metum, notice: 'Repo metum was successfully updated.' }
        format.json { render :show, status: :ok, location: @repo_metum }
      else
        format.html { render :edit }
        format.json { render json: @repo_metum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /repo_meta/1
  # DELETE /repo_meta/1.json
  def destroy
    @repo_metum.destroy
    respond_to do |format|
      format.html { redirect_to repo_meta_url, notice: 'Repo metum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_repo_metum
      @repo_metum = RepoMetum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def repo_metum_params
      params.require(:repo_metum).permit(:repo_id, :description).merge({user_id: current_user.id})
    end
end
