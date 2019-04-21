class Api::V1::PostsController < Api::V1::ApiController
  before_action :authorize_request
  

  def index 
    @users = User.all 
  end

end