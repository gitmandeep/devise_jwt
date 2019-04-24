# frozen_string_literal: true

class Api::V1::UsersController < Api::V1::ApiController
 
  before_action :authorize_request, except: :create
  before_action :find_user, except: %i[create index]

  # GET /users
  def index
    @users = User.all
    render json: @users, status: :ok
  end

  # GET /users/{username}
  def show
    render json: @user, status: :ok
  end

  # POST /users
  def create
    @user = User.new(user_params)
    binding.pry
    if @user.save
      render json: @user, status: :created
    else
    binding.pry
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PUT /users/{username}
  def update
    unless @user.update(user_params)
      render json: { errors: @user.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  # DELETE /users/{username}
  def destroy
    @user.destroy
  end

  private

  def find_user
    @user = User.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { errors: 'User not found' }, status: :not_found
  end

  def user_params
    params.require(:user).permit(
      :email, :password, :password_confirmation
    )
  end
end

























































































#   before_action :set_user, except: %i[index create]

#   def index
#     order = { first_name: sort_flag }

#     where = policy_condition(User)

#     where[:participated_group_ids] = params[:group_id] if params[:group_id]

#     where[:roles] = [current_organization.id, params[:role]].join('_') if params[:role]

#     @users = User.search params[:term] || '*',
#       where: where,
#       order: order,
#       page: current_page,
#       per_page: current_count,
#       fields: User::SEARCH_FIELDS,
#       match: :word_start

#     render_result @users
#   end

#   def show
#     render_result @user
#   end

#   def update
#     if @user.update permitted_attributes(@user)
#       render_result(@user) else render_error(@user)
#     end
#   end

#   def destroy
#     render_result success: @user.deleted!
#   end

#   def create
#     @user = User.new
#     @user.skip_confirmation!

#     authorize @user

#     if @user.update permitted_attributes(@user)
#       render_result(@user) else render_error(@user)
#     end
#   end

#   def send_set_password_link
#     render_result success: !!@user.send_reset_password_instructions
#   end

#   private

#   def set_user
#     @user = User.find params[:id]

#     authorize @user
#   end
# end
