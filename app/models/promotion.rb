class Promotion < ActiveRecord::Base

  mount_uploader :file, FileUploader

  validates :name, presence: true
  validates :starts_at, presence: true
  validates :ends_at, presence: true

  attr_accessible :name, :file, :starts_at, :ends_at

  after_initialize :set_start_and_end_date

  def set_start_and_end_date
    self.starts_at = Time.now.to_date
    self.ends_at = (Time.now + 1.month).to_date
  end
end