module ProductsHelper
  def flattened ary
    ary.map(&:titleize).join(", ")
  end
end
