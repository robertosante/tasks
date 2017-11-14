class Task < ApplicationRecord
  
  belongs_to :user
  before_save :set_header

  enum status: { unfinished: 0, finished: 1 }

  validates_presence_of :description, :website, :status

  def self.filter(filter)
    if filter
      where("website LIKE ? OR description LIKE ? ", filter, filter)
    else
      all
    end
  end

  private

    def set_header
      require 'open-uri'
      doc = Nokogiri::HTML(open(self.website)).search('h1').first.text
      self.header = doc
    end

end
