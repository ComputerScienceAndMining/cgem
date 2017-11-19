module Dynamisable
  extend ActiveSupport::Concern
 
  included do
    after_save :fill_data_pictures
  end

  # Fill pictures inside data hash
  def fill_data_pictures
    return unless self.respond_to? :pictures
    
    # Deep copy from data
    new_data = self.data.deep_dup

    # Fill data from new pictures
    new_data['fields'].each do |field|
      if field['type'] == 'pictures'
        field['pictures'].each do |data_picture|
          pictures.each do |obj_picture|
            unless data_picture['id']
              if data_picture['local_id'] == obj_picture.local_id
                data_picture['id'] = obj_picture.id
                data_picture['sample_id'] = obj_picture.sample_id
                data_picture['specimen_id'] = obj_picture.specimen_id
                data_picture['lab_test_id'] = obj_picture.lab_test_id
                data_picture['thumb_url'] = obj_picture.image.url(:thumb)
                data_picture['original_url'] = obj_picture.image.url(:original)
              end
            end
          end
        end
      end
    end

    # Remove destroyed pictures from data
    new_data['fields'].each do |field|
      if field['type'] == 'pictures'
        field['pictures'] = field['pictures'].select {|p| !p['_destroy']}
      end
    end

    # Remove from data pictures without image
    new_data['fields'].each do |field|
      if field['type'] == 'pictures'
        field['pictures'] = field['pictures'].select {|p| !(p.size == 1 && p.has_key?('local_id'))}
      end
    end

    unless new_data == self.data
      self.update_column(:data, new_data)
    end
  end
end