module SharedConcerns
  module Fengable
    extend ActiveSupport::Concern

    included do

      def fengable?
        [feng_username, feng_password, feng_url].all? { |attr| attr.present? }
      end

    end

  end

  module FengWorkHours
    extend ActiveSupport::Concern

    included do

      after_create :create_feng_hours

      private

      def create_feng_hours
        if user.fengable?
          feng_api = Feng.new(user.feng_username, user.feng_password, user.feng_url)

          feng_api.add_hours(user.feng_project_id, self.on, self.amount, self.description)
        end
      end

    end

  end
end