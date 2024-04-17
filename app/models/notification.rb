class Notification < ApplicationRecord
  belongs_to :local_government
  belongs_to :notifiable, polymorphic: true
end
