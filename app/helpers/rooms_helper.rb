module RoomsHelper
  def is_done?(item)
    unless item.blank?
      content_tag :i, nil, class: "fa fa-check"
    end
  end

  def is_ready?(room)
    !room.price.blank? && !room.description.blank? && !room.photos.blank? && !room.address.blank?
  end
end
