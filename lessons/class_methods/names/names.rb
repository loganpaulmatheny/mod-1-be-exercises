require 'csv'
require 'pry'

class Name
  attr_reader :year, :bio_gender, :ethnicity, :name, :count, :rank
  @@filename = './names/Popular_Baby_Names.csv'

  def initialize(data)
    @year = data[:year_of_birth]
    @bio_gender = data[:gender]
    @ethnicity = data[:ethnicity]
    @name = data[:childs_first_name]
    @count = data[:count]
    @rank = data[:rank]
  end
  
  def self.reader
    headers = CSV.open(@@filename, &:readline).map(&:downcase)
  
    # Read CSV file with lowercase headers
    rows = CSV.read(@@filename, headers: headers, header_converters: :symbol)
    [headers, rows]
  end

  def self.print_data(data)
    data.each do |name|
      puts name.inspect
      puts "\n"
    end
  end

  def self.find_by_name1(name)
    rows = CSV.read(@@filename, headers: true)
    result = []
    
    puts "Headers: #{rows.headers}"
    # new code goes here
    rows.each do |row|
      # puts "Child Names: #{row["Child's First Name"]}"
      if row["Child's First Name"].downcase == name.downcase
        puts row
        result << Name.new(row)
      end
    end
    result
  end
  
  def self.find_by_year(year)
    rows = CSV.read(@@filename, headers: true)
    result = []
    
    puts "Headers: #{rows.headers}"
    # new code goes here
    rows.each do |row|
      # puts "Child Names: #{row["Child's First Name"]}"
      if row["Year of Birth"].to_i == year
        puts row
        result << Name.new(row)
      end
    end
    result
  end

  def self.where(category)
    # Map headers to lowercase
    headers = CSV.open(@@filename, &:readline).map(&:downcase)
  
    # Read CSV file with lowercase headers
    rows = CSV.read(@@filename, headers: headers, header_converters: :symbol)
    result = []

    # puts headers

    # I want to use the key to look at the rows and the value to compare
    rows.each do |row|
      if row[category.keys[0].to_sym] == category.values[0]
        # puts row
        result << Name.new(row)
      end
    end
    puts result.count
    # result.each do |name|
    #   puts name.inspect
    #   puts "\n"
    # end
  end

  def self.order(sort_type)
    headers, rows = self.reader
    if sort_type.values[0] == :asc
      sorted_data = rows[1..-1].sort_by {|row| row[sort_type.keys[0].to_sym]} 
    else 
      sorted_data = rows[1..-1].sort_by {|row| row[sort_type.keys[0].to_sym]}.reverse
    end 
    first_line = sorted_data[0]
    sorted_data.shift
    sorted_data.push(first_line)
    CSV.open('sorted_example.csv', 'w') do |csv|
      # Write rows
      csv << headers
      sorted_data.each do |row|
        csv << row
      end
    end
    system("open sorted_example.csv")
  end

end


binding.pry