module DynamicHelper

  def field_title(obj, field)
    field["name"]
  end

  def field_value(obj, field, empty: t('empty_value', scope: :dynamic_fields))
    return empty if ((field["value"].nil?) or
                       (not field["value"].is_a? Numeric and field["value"].empty?)) and 
                       (field["type"] != "pictures")

    case field["type"]
    when "pictures"
      field_images(obj, field)
    when "date"
      field["value"].split("T")[0]
    else
      field["value"]
    end
  end

  def field_images(obj, field, empty: t('empty_value', scope: :dynamic_fields))
    return empty if field["pictures"].nil? or field["pictures"].empty?

    html = ''
    
    if field["pictures"].size > 0
      html += <<-HTML
        <div class="photoswipe-gallery" itemscope itemtype="http://schema.org/ImageGallery">
      HTML
    end

    field["pictures"].each do |pict|
      obj.pictures.each do |picture|
        if pict["local_id"] == picture.local_id
          html += <<-HTML
          <figure class="thumb" itemprop="associatedMedia" itemscope itemtype="http://schema.org/ImageObject">
            <a href="#{picture.image.url(:original)}" itemprop="contentUrl" data-size="#{picture.image.image_size}">
                <img src="#{picture.image.url(:thumb)}" itemprop="thumbnail" alt="Image description" />
            </a>
          </figure>
          HTML
        end
      end
    end

    if field["pictures"].size > 0
      html += <<-HTML
        </div>
      HTML
    end

    html.html_safe
    # html = <<-HTML
    #   <div class="container">
    #     <div class="row">
    #       <div class="col-sm-12">
    #         <div class="alert alert-danger alert-dismissable">
    #           <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
    #           <strong><i class="icon fa fa-ban"></i> #{t('error_title', scope: :flash)}:</strong> #{sentence}
    #           #{messages}
    #         </div>
    #       </div><!-- /.col -->
    #     </div>
    #   </div>
    # HTML
    # html.html_safe
  end

  def xls_field_type(obj, field)
    return "String" if field["value"].nil?
    return "String" if field["type"] == "text"
    return "Number" if field["type"] == "number"
    return "String"
  end
end
