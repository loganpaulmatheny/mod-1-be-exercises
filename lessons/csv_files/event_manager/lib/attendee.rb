class Attendee
  attr_reader :id, :first_name, :last_name, :zipcode

  def initialize(id, first_name, last_name, zipcode)
    @id = id
    @first_name = first_name
    @last_name = last_name
    @zipcode = zipcode
  end

  def full_name
    @first_name + " " + @last_name
  end

  def shorten_zip
    if @zipcode.nil?
      zip = "International"
    elsif @zipcode.length < 5 
      @zipcode = @zipcode.rjust(5, '0')
      zip = @zipcode[0,5]
    else
      zip = @zipcode
    end 
  end
end