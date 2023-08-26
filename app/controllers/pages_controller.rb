class PagesController < ApplicationController
  before_action :set_page, only: %i[ show edit update destroy ]
  before_action :ensure_user, only: %i[ show edit update destory ]
  before_action :redirect_to_page, only: %i[index new create destroy]

  # GET /pages or /pages.json
  def index
    @pages = Page.all
  end

  # GET /pages/1 or /pages/1.json
  def show
  end

  # GET /pages/new
  def new
    @page = Page.new
  end

  # GET /pages/1/edit
  def edit
  end

  # POST /pages or /pages.json
  def create
    @page = Page.new(page_params.merge!(user: current_user))

    respond_to do |format|
      if @page.save
        format.html { redirect_to page_url(@page), notice: "Page was successfully created." }
        format.json { render :show, status: :created, location: @page }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pages/1 or /pages/1.json
  def update
    respond_to do |format|
      if @page.update(page_params)
        format.html { redirect_to page_url(@page), notice: "Page was successfully updated." }
        format.json { render :show, status: :ok, location: @page }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1 or /pages/1.json
  def destroy
    @page.destroy

    respond_to do |format|
      format.html { redirect_to pages_url, notice: "Page was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    
    def ensure_user
      redirect_to pages_path if current_user.page.blank?
    end

    def redirect_to_page
      redirect_to page_path(current_user.page) if current_user.page.present?
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = Page.find(params[:id]) if current_user.admin?
      @page = Page.find(current_user.page.id) if !current_user.admin? && current_user.page.present?
    end

    # Only allow a list of trusted parameters through.
    def page_params
      params.require(:page).permit(:name, :about, :website, :phone, :whatsapp, :cover)
    end
end
