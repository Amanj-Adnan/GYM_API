class Api::V1::Auth::UsersController < ApplicationController
    def index
        @users = User.all
        render jsonapi: @users,status: 200
    end

end
