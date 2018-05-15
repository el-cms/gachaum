# frozen_string_literal: true

class LogsController < ApplicationController
  before_action :set_log, only: %i[show edit update destroy]

  # GET /logs
  # GET /logs.json
  def index
    @logs = Log.all.order(id: :desc)
  end

  # GET /logs/1
  # GET /logs/1.json
  def show; end

  # GET /logs/new
  def new
    @log = Log.new
  end

  # GET /logs/1/edit
  def edit; end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_log
    @log = Log.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def log_params
    params.require(:log).permit(:card_id, :user_id)
  end
end
