class Event < ActiveRecord::Base
  # 欄位必填
  validates_presence_of :name
  # 預設設定排序
  default_scope {order("id asc")}
  # scope :public2, where( :is_public => true )
  # scope :recent_three_days, where(["created_at > ? ", Time.now - 3.days ])

  def self.public_event
    where(:is_public => true)
  end

  def self.recent(t=Time.now)
    where(["created_at > ? ", t ])
  end

  # 虛擬屬性(Virtual Attribute)
  def fullname
    "#{self.name}-#{self.description}"
  end

end
