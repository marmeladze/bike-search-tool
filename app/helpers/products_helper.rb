module ProductsHelper
  def flattened(ary, behaviour="removable")
    ary.map(&:titleize).map{|e| labelize(e, behaviour) }.join(" ")
  end

  def labelize(el, behaviour)
  	content_tag(:span, el.titleize, class: "label label-info #{behaviour}")
  end

end
