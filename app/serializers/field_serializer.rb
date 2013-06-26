class FieldSerializer < ActiveModel::Serializer
  attributes :id, :editable, :field_type, :font_family, :font_size, :has_text_shadow, :letter_spacing, :line_height, :name, :region, :text, :text_align, :text_shadow, :word_spacing, :card_id, :image, :top, :left, :width, :height, :color, :bg
  
  def image
  	object.image_url
  end
  
end
