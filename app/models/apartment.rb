class Apartment < ActiveRecord::Base
  belongs_to :landlord
  belongs_to :user
  has_many :deals
  has_many :assets, dependent: :destroy
  #has_attached_file :photo, :styles => { :large => "800>", :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/photo/:style/missing.png", :url => "/upload/:class/:attachment/:id_partition/:style/:filename"
  
  #validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
  validates_presence_of :address
  accepts_nested_attributes_for :assets, reject_if: :all_blank, allow_destroy: true

  scope :newest, -> { where(status: "new") }
  scope :lost, -> { where(status: "lost") }
  scope :confirmed, -> { where(status: "confirmed") }
  scope :rented, -> { where(status: "rented") }
  scope :advertised, -> { where(status: "advertised") }

  STATUSES = %w{ new confirmed rented advertised lost }
  ## В представлении для селекта формы
  ## можно воспользоваться f.select(:status, Apartment::STATUSES.map {|status| [status, Apartment::STATUSES.index(level)] })

  #STATUSES.each_with_index do |meth, index|
  #  define_method("#{meth}?") { type == index }
  #end

end
