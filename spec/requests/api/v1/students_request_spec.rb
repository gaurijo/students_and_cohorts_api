require 'rails_helper'

describe 'Students API' do 

  it 'has a list of students' do 
    cohort_2107_be = Cohort.create(name: "2107 BE", start_date: Date.parse('01-07-2021'), graduation_date: Date.parse('01-02-2022') )

    cohort_2107_be.students.create(first_name: "Jessie", last_name: "Smith", preferred_name: "Jess", pronouns: "xe/xem",  email: "Jessie@email.com", github_username: "Jessie_github", slack_username: "Jessie_slack")
    cohort_2107_be.students.create(first_name: "Marion", last_name: "Johnson", preferred_name: "Marion", pronouns: "she/they",  email: "Marion@email.com", github_username: "Marion_github", slack_username: "Marion_slack")
    cohort_2107_be.students.create(first_name: "Alva", last_name: "Brown",  preferred_name: "Alva", pronouns: "ze/zir",  email: "Alva@email.com", github_username: "Alva_github", slack_username: "Alva_slack")

    get "/api/v1/cohorts/#{cohort_2107_be.id}/students"

    expect(response).to be_successful 
  end
end