class ReportsUsersController < ApplicationController
  def show
    @reports_user = ReportsUser.find(params[:id])
    render text: @reports_user.report
  end

  def destroy
    @reports_user = ReportsUser.find(params[:id])
    @reports_user.destroy

    respond_to do |format|
      format.html { redirect_to users_path, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
end
