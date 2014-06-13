class Event < ActiveRecord::Base
  # 欄位必填
  validates_presence_of :name
end
