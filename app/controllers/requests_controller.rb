class RequestsController < ApplicationController
  def new
    @request = Request.new
  end

  def create
    request_params = params.require(:request).permit([:name, :email, :department, :message])
    @request = Request.new request_params
    if @request.save
      redirect_to request_path(@request)
    else
      render :new
    end
  end

  def show
    @request = Request.find params[:id]
  end

  def index
    @requests = Request.all
  end

  def edit
    @request = Request.find params[:id]
  end

  def update
    request_params = params.require(:request).permit([:name, :email, :department, :message])
    @request = Request.find params[:id]
    if @request.update(request_params)
      redirect_to request_path(@request), notice: "POST UPDATED!"
    else
      render :edit
    end
  end

  def destroy
    @request = Request.find params[:id]
    @request.destroy
    flash[:notice] = "Request deleted successfully"
    redirect_to requests_path
  end
end
