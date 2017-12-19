module ProductsHelper
  def flattened ary
    ary.map(&:titleize).map{|e| labelize e }.join(" ")
  end

  def labelize el
  	content_tag(:span, el, class: "label label-info")
  end
end
