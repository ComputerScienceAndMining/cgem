class HomeController < ApplicationController
  def index
    @test = 'test'
    redirect_to work_orders_url
  end
end
