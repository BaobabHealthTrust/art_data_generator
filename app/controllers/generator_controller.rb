class GeneratorController < ApplicationController
  def patients

  end

  def create_patient
    start_year = params[:dob].to_i
    year_diff = Date.today.year.to_i - start_year
    gender = params[:gender].to_s

    if gender == 'B'
      #generate random gender
      gender_array = ['M', 'F']
      gender = gender_array[rand(0..1)]
    end 

  	date = Faker::Date.between_except(year_diff.year.ago, 1.year.from_now, Date.today).to_date

  	params = {"relation"=>"", "p"=>{"addresses"=>{"city_village_a"=>"", 
  		"county_district_a"=>""}, "'address2_a'"=>""}, "identifier"=>"", 
  		"filter"=>{"t_a"=>"S/C Chakhadza", "t_a_a"=>"", "region"=>"Central Region"}, 
  		"person"=>{"addresses"=>{"city_village"=>"Beleki", 
  		"county_district"=>"Kilipula", "address1"=>"Other", "address2"=>"Karonga",
  		"neighborhood_cell"=>"Andreya Chabinga", "state_province"=>"Dowa "}}, 
  		"patient_year"=>"1882","names"=>{"middle_name"=>""}, 
  		"patient_day"=>"21", "patient_month"=>"4", 
  		"patient_age" =>{"age_estimate"=>""}, "patient"=>{"gender"=>gender},
  		"patient_name" => {"family_name"=>Faker::Name.last_name, 
  		"given_name"=>Faker::Name.first_name}, "guardian_present"=>"NO", 
  		"office_phone"=>{"identifier"=>Faker::PhoneNumber.phone_number},
  		"cell_phone" => {"identifier"=>Faker::PhoneNumber.cell_phone},
  		"home_phone"=>{"identifier"=>Faker::PhoneNumber.phone_number}, 
  		"region"=>{"region_name"=>"Northern Region"}}
  	#raise params['birth_year'].inspect
  	uri = "http://admini:test@192.168.18.253:3000/patient/create_remote/"

    person = JSON.parse(RestClient.post(uri,params))
    render text: 'did not create'.to_json and return if person.blank?
    render text: person.to_json and return
  end

  def test
  	 sum = params[:a].to_i + params[:b].to_i
  	 render :text => sum and return 
  end

  def visits
    #uri = "http://admini:test@192.168.18.253:3000/GenericPatientsController/search_all"
    #person = JSON.parse(RestClient.post(uri)).to_json 
  end
	
  def list_of_patients_without_any_encounters
    uri = "http://192.168.18.253:3000/data_generator/patients_without_any_encs"
    patients = JSON.parse(RestClient.post(uri,params))
    
    render text: patients.to_json and return
  end

end
