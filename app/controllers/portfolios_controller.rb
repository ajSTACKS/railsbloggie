class PortfoliosController < ApplicationController
before_action :set_port, only: [:show, :edit, :update, :destroy]
access all: [:show, :index], user: {except: [:destroy, :new, :create, :edit, :update]}, site_admin: :all, message: "keep Trying sucka"

layout "portfolio"
  def index
    @portfolio_items = Portfolio.all
  end

  def show
  end

  def new
    @portfolio_item = Portfolio.new
    3.times { @portfolio_item.technologies.build }
  end

  def create
    @portfolio_item = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Your portfolio is live.' }

      else
        format.html { render :new }

      end
    end
  end

  def edit
    3.times { @portfolio_item.technologies.build }
  end

  def update

    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: 'the record was successfully updated.' }

      else
        format.html { render :edit }

      end
    end
  end

  def destroy

    #destroys and deletes the record
    @portfolio_item.destroy

    #reroutes the destroy method
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'youre shit was deleted son' }

    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_port
      @portfolio_item = Portfolio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def portfolio_params
      params.require(:portfolio).permit(:title,
                                        :subtitle,
                                        :body,
                                        :main_img, :thumb_img,  technologies_attributes: [:name])
    end
end
