module Paginate
  extend ActiveSupport::Concern
  include Kaminari::PageScopeMethods

  included do
    scope :paginate, ->(params) { page(params[:page]).per(10) }
  end
end