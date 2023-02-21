class CompaniesController < ApplicationController

  def index
    @companies = Company.all
  end

  def show
    @company = Company.find_by({ "id" => params["id"] })
    @contacts = Contact.where({ "company_id" => @company["id"] })
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new
    @company["name"] = params["company"]["name"]
    @company["city"] = params["company"]["city"]
    @company["state"] = params["company"]["state"]
    @company.save
    redirect_to "/companies"
  end

  def edit
    @company = Company.find_by({ "id" => params["id"] })
  end

  def update
    @company = Company.find_by({ "id" => params["id"] })
    if @current_user
      @company["name"] = params["company"]["name"]
      @company["city"] = params["company"]["city"]
      @company["state"] = params["company"]["state"]
      @company.save
    else
      flash["notice"] = "You must be logged in."
    end
    redirect_to "/companies/#{@company["id"]}"
  end
  
  def destroy
    @company = Company.find_by({ "id" => params["id"] })
    if @current_user
      @company.destroy
      redirect_to "/companies"
    else
      flash["notice"] = "You must be logged in."
      redirect_to "/companies/#{@company["id"]}"
    end
  end

end