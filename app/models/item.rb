class Item < ApplicationRecord
    belongs_to :survival
    validates :fiji_water, presence: true,numericality: { greater_than_or_equal_to: 0}
    validates :campbell_soup, presence: true,numericality: { greater_than_or_equal_to: 0}
    validates :first_aid_pouch, presence: true,numericality: { greater_than_or_equal_to: 0}
    validates :ak, presence: true,numericality: { greater_than_or_equal_to: 0}
end
