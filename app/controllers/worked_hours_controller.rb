class WorkedHoursController < ApplicationController

  def create
    @worked_hour = WorkedHour.new(params[:tag])
    @worked_hour.user = current_user

    respond_to do |format|
      if @worked_hour.save
        format.html { redirect_to root_path, notice: 'La hora se agregó correctamente.' }
        format.json { render json: @worked_hour, status: :created, location: @worked_hour }
      else
        format.html { render action: "new" }
        format.json { render json: @worked_hour.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @worked_hour = WorkedHour.find(params[:id])

    respond_to do |format|
      if @worked_hour.update_attributes(params[:ticket])
        format.html { redirect_to root_path, notice: 'La hora se actualizó correctamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @worked_hour.errors, status: :unprocessable_entity }
      end
    end
  end

end