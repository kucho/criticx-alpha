class ParentGameValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    case record.main_game?
    when true
      unless value.blank?
        record.errors[attribute] << (options[:message] || 'not required on main_games')
      end
    when false
      if Game.find_by(id: value).nil?
        record.errors[attribute] << (options[:message] || 'is not a valid game')
      end
    end
  end
end