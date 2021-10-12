# frozen_string_literal: true

class HealthController < ApplicationController
  def show
    health_checks = {
      postgresql: postgresql
    }

    render json: {
      checks: health_checks
    }, status: status(health_checks)
  end

  private

  def status(health_checks)
    if health_checks.all? { |_, result| result.fetch(:success) }
      :ok
    else
      :service_unavailable
    end
  end

  def postgresql
    check_health do
      ActiveRecord::Base.connection.execute('SELECT true AS healthy').to_a.dig(0, 'healthy')
    end
  end

  def check_health
    { success: !!yield }
  rescue StandardError => e
    {
      success: false,
      error: {
        class: e.class.name,
        message: e.message
      }
    }
  end
end
