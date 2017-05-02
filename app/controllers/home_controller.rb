class HomeController < ApplicationController
  def index
    currency_select = JSON.parse(File.read("./spec/fixtures/currency_list.json"))

  end

  def exchange
    value = Currency::exchange params[:currency], params[:currency_destination], params[:quantity].to_f
    render json: {"value": value}
  end
end
