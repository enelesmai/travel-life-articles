module TravelsHelper
  def travels_by_category(category)
    Category.where(category).travels.order(created_at: :desc)
  end
end
