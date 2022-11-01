# frozen_string_literal: true

class ApplicationController < ActionController::Base
  around_action :handle_exception

  def home; end

  def about; end

  def dogs; end

  def food; end

  def _navbar; end

  private

  def handle_exception
    begin
      yield
    rescue ActiveRecord::RecordNotFound => e
      puts e.message
      flash[:alert] = e.message
    rescue StandardError => e
      puts e.message
      flash[:alert] = e.message
    end
  end
end
