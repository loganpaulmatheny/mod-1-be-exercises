office_supplies = {
  "staples" => 9000,
  "paper" => 45050, 
  "chairs" => 5,
  "desks" => 2, 
}

p office_supplies["staples"]
office_supplies["paper"] = office_supplies["paper"] + 2000
p office_supplies["paper"]

p office_supplies.keys

def list_office_supplies(office_supplies)
  output_string = "Office supplies: "
  output_string += office_supplies.map {|key, value| "#{value} #{key}"}.join(", ")
  p output_string
end 

list_office_supplies(office_supplies)