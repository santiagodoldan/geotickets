class WorkedHoursController < ApplicationController

  layout false

  respond_to :json, :html

  def index
    @worked_hour = WorkedHour.scoped

    respond_with(@worked_hour)
  end

  def create
    @worked_hour = current_user.worked_hours.create(params[:worked_hour])

    respond_with(@worked_hour)
  end

  def update
    @worked_hour = current_user.worked_hours.find(params[:id])

    respond_to do |format|
      if @worked_hour.update_attributes(params[:worked_hour])
        format.html { redirect_to root_path, notice: 'La hora se actualizo correctamente' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @worked_hour.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @worked_hour = current_user.worked_hours.find(params[:id])
    @worked_hour.destroy

    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { head :no_content }
    end
  end

end