module ProductsHelper
  def flattened ary
    ary.map(&:titleize).map{|e| labelize e }.join(" ")
  end

  def labelize el
  	content_tag(:span, el.titleize, class: "label label-info removable")
  end
end
