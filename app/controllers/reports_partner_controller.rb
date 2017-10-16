class ReportsPartnerController < ApplicationController
  def show
    @reports_partner = ReportsPartner.find(params[:id])
    render text: @reports_partner.report
  end

  def destroy
    @reports_partner = ReportsPartner.find(params[:id])
    @reports_partner.destroy

    respond_to do |format|
      format.html { redirect_to partners_path, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
end
