class GeneratorController < ApplicationController
  def patients
  end

  def create_patient
  	date = Faker::Date.between_except(10.year.ago, 1.year.from_now, Date.today).to_date

  	params = {"relation"=>"", "p"=>{"addresses"=>{"city_village_a"=>"", 
  		"county_district_a"=>""}, "'address2_a'"=>""}, "identifier"=>"", 
  		"filter"=>{"t_a"=>"S/C Chakhadza", "t_a_a"=>"", "region"=>"Central Region"}, 
  		"person"=>{"addresses"=>{"city_village"=>"Beleki", 
  		"county_district"=>"Kilipula", "address1"=>"Other", "address2"=>"Karonga",
  		"neighborhood_cell"=>"Andreya Chabinga", "state_province"=>"Dowa "}}, 
  		"patient_year"=>"1882","names"=>{"middle_name"=>""}, 
  		"patient_day"=>"21", "patient_month"=>"4", 
  		"patient_age" =>{"age_estimate"=>""}, "patient"=>{"gender"=>"M"},
  		"patient_name" => {"family_name"=>Faker::Name.last_name, 
  		"given_name"=>Faker::Name.first_name}, "guardian_present"=>"NO", 
  		"office_phone"=>{"identifier"=>Faker::PhoneNumber.phone_number},
  		"cell_phone" => {"identifier"=>Faker::PhoneNumber.cell_phone},
  		"home_phone"=>{"identifier"=>Faker::PhoneNumber.phone_number}, 
  		"region"=>{"region_name"=>"Northern Region"}}
  	#raise params['birth_year'].inspect
  	uri = "http://admin:test@192.168.18.239:5000/patient/create_remote/"

    person = JSON.parse(RestClient.post(uri,params))
    render text: 'did not create'.to_json and return if person.blank?
    render text: person.to_json and return
  end

  def test
  	 sum = params[:a].to_i + params[:b].to_i
  	 render :text => sum and return 
  end

end
