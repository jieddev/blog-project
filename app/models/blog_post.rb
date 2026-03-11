class BlogPost < ApplicationRecord
  has_rich_text :content

  belongs_to :user
  has_many :likes
  has_many :liking_users, through: :likes, source: :user
  has_many :comments

  validates :title, presence: true 
  validates :content, presence: true 

  scope :order_by_publish_date, -> { order(published_at: :asc) }
  scope :draft, -> { where(published_at: nil) }
  scope :published, -> { where("published_at <= ?", Time.current )}
  scope :scheduled, -> { where("published_at > ?", Time.current )}

  def draft 
    published_at.nil?
  end

  def published
    published_at? && published_at >= Time.current
  end

  def scheduled
    published_at? && published_at < Time.current
  end


end

