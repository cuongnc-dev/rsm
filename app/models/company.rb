class Company < ApplicationRecord
  has_many :appointments, dependent: :destroy
  has_many :projects, dependent: :destroy
  has_many :jobs, dependent: :destroy
  has_many :members, dependent: :destroy
  has_many :users, through: :members, dependent: :destroy
  has_many :passive_report, class_name: Report.name, as: :reported, dependent: :destroy
  has_many :passive_follow, class_name: Relationship.name, as: :followed, dependent: :destroy
  has_many :activities, dependent: :destroy
  has_many :partners, dependent: :destroy

  accepts_nested_attributes_for :activities, allow_destroy: true
  accepts_nested_attributes_for :partners, allow_destroy: true

  mount_uploader :banner, ImageUploader
  mount_uploader :logo, LogoUploader

  validates :name, presence: true
  validates :majors, presence: true
  VALID_PHONE_REGEX = /\A(?:\+?\d{1,3}\s*-?)?\(?(?:\d{3})?\)?[- ]?\d{3}[- ]?\d{4}\z/i
  validates :phone, presence: true, format: {with: VALID_PHONE_REGEX}, uniqueness: {case_sensitive: false}
end
