class PartnersController < ApplicationController
  before_action :set_post, only: [ :show, :edit, :update, :destroy]

  def index
    @stat_part = Partner.where(stage_number: params['stage_number'])
                        .paginate(:page => params[:page], :per_page => 16)
                        .order(created_at: :desc)

  end

  def show
    @stats_part = Partner.all
  end

  def new
    @stat_part = Partner.new
  end

  def edit
  end

  def create
    @stats_part = Partner.new(post_params)
    respond_to do |format|
      if @stats_part.save
        format.html { redirect_to @stats_part , notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @stats_part }
      else
        format.html { render :new }
        format.json { render json: @stats_part.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @stat_part.update(post_params)
        format.html { redirect_to @stat_part, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @stats_part }
      else
        format.html { render :edit }
        format.json { render json: @stat_part.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    ReportsPartner.where(user_id: @stat_part.id).destroy_all
    @stat_part.destroy
    respond_to do |format|
      format.html { redirect_to partners_path, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_post
      @stat_part = Partner.find(params[:id])
    end

    def post_params
      params.require(:partner).permit(
        :platform,
        :skype,
        :nickname,
        :card,
        :driver,
        :email,
        :refcode,
        :locale,
        :stage_number,
        :phone,
        :tariff_first,
        :tariff_last,
        :cpa_first,
        :cpa_last,
        :created_at,
        :updated_at,
        :referall,
        :bonuse_code,
        )
    end
end
