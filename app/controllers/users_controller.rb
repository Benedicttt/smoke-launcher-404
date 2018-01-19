class UsersController < ApplicationController
  before_action :set_post, only: [ :show, :edit, :update, :destroy]

  def index
    @stat = User.where(stage_number: params['stage_number'])
                .paginate(:page => params[:page], :per_page => 16)
                .order(created_at: :desc)
  end

  def show
    @stats = User.all
  end

  def new
    @stat = User.new
  end

  def edit
  end

  def create
    @stats = User.new(post_params)

    respond_to do |format|
      if @stats.save
        format.html { redirect_to @stats , notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @stats }
      else
        format.html { render :new }
        format.json { render json: @stats.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @stat.update(post_params)
        format.html { redirect_to @stat, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @stats }
      else
        format.html { render :edit }
        format.json { render json: @stat.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    ReportsUser.where(user_id: @stat.id).destroy_all
    @stat.destroy
    respond_to do |format|
      format.html { redirect_to users_path, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_post
      @stat = User.find(params[:id])
    end

    def post_params
      params.require(:user).permit(
        :email,
        :locale,
        :tariff,
        :currency,
        :geo_locale,
        :stage_number,
        :password,
        :first_name,
        :last_name,
        :platform,
        :created_at,
        :updated_at,
        :wire_capital,
        :ecommpay,
        :card_pay,
        :phone_verifed,
        :document_verifed,
        :status,
        :email_confirmed,
        :refcode)
    end
end
