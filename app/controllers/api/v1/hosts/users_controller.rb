class Api::V1::Hosts::UsersController < HostBaseController
  def index
    render status: :ok, json: current_host
  end
end
