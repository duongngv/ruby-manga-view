module ComicsHelper
  def get_category category_id
    return unless (@category = Category.find_by id: category_id.to_s)

    @category.name
  end
end
