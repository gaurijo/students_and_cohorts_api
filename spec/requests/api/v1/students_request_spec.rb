require 'rails_helper'

describe 'Students API' do 

  it 'has a list of all students' do 
    cohort_2103_fe = Cohort.create(name: "2103 FE", start_date: Date.parse('01-03-2021'), graduation_date: Date.parse('01-10-2021') )
    cohort_2105_be = Cohort.create(name: "2105 BE", start_date: Date.parse('01-05-2021'), graduation_date: Date.parse('01-12-2021') )
    cohort_2107_be = Cohort.create(name: "2107 BE", start_date: Date.parse('01-07-2021'), graduation_date: Date.parse('01-02-2022') )
    cohort_2009_fe = Cohort.create(name: "2009 FE", start_date: Date.parse('01-09-2020'), graduation_date: Date.parse('01-04-2021') )
    cohort_2107_be.students.create(first_name: "Jessie", last_name: "Smith", preferred_name: "Jess", pronouns: "xe/xem",  email: "Jessie@email.com", github_username: "Jessie_github", slack_username: "Jessie_slack")
    cohort_2103_fe.students.create(first_name: "Logan", last_name: "Lee", preferred_name: "Logan", pronouns: "he/they",  email: "Logan@email.com", github_username: "Logan_github", slack_username: "Logan_slack")
    cohort_2105_be.students.create(first_name: "Skylar", last_name: "Gomez", preferred_name: "Skylar", pronouns: "he/him",  email: "Skylar@email.com", github_username: "Skylar_github", slack_username: "Skylar_slack")
    cohort_2009_fe.students.create(first_name: "Santana", last_name: "Cooper", preferred_name: "Santana", pronouns: "she/her",  email: "Santana@email.com", github_username: "Santana_github", slack_username: "Santana_slack")
    
    get "/api/v1/students"

    expect(response).to be_successful 
    expect(response.status).to eq(200)

    students = JSON.parse(response.body, symbolize_names: true)[:data]

    students.each do |student|
      expect(student[:id]).to be_a(String)
      expect(student).to have_key(:attributes)
      expect(student[:attributes]).to have_key(:first_name)
      expect(student[:attributes]).to have_key(:last_name)
      expect(student[:attributes]).to have_key(:preferred_name)
      expect(student[:attributes]).to have_key(:pronouns)
      expect(student[:attributes]).to have_key(:email)
      expect(student[:attributes]).to have_key(:github_username)
      expect(student[:attributes]).to have_key(:slack_username)
    end
  end
end