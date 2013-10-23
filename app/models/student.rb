require_relative '../../db/config'
require 'date'

class Student < ActiveRecord::Base
  # attr_reader :birthday
  # def assign_attributes(args)
  #     @first_name = args[:first_name]
  #     @last_name = args[:last_name]
  #     @gender = args[:gender]
  #     @birthday = args[:birthday]
  #  end


  validates :age, :exclusion => {:in => (0..5).to_a}

  validates :email, :uniqueness => true, :format => { :with => /.+@.+\..{2,}/,
    :message => "Only valid emails allowed"}

  validates :phone, :format => {:with => /\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*/,
    :message => "only valid phone numbers"}
    # validates :phone :format => {:with => /.+@.+\..{2,}/,
    # :message => "Only valid emails allowed"}





  def name
    self.first_name + " "  + self.last_name
  end

  def age
    now = Date.today
    now.year -  self.birthday.year
  end

  def age_check
    # now = Date.today
    # current_age = now.year -  self.birthday.year
    # puts current_age
    # current_age >=   5.0 ? true : false
  false
  end

  def check_email
    self.email
  end

end