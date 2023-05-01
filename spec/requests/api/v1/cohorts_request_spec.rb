require 'rails_helper'

describe 'Cohorts API' do 

  it 'can find a cohort info based on id' do
    cohort_2107_be = Cohort.create(name: "2107 BE", start_date: Date.parse('01-07-2021'), graduation_date: Date.parse('01-02-2022') )
    cohort_2103_fe = Cohort.create(name: "2103 FE", start_date: Date.parse('01-03-2021'), graduation_date: Date.parse('01-10-2021') )
    cohort_2105_be = Cohort.create(name: "2105 BE", start_date: Date.parse('01-05-2021'), graduation_date: Date.parse('01-12-2021') )
    cohort_2009_fe = Cohort.create(name: "2009 FE", start_date: Date.parse('01-09-2020'), graduation_date: Date.parse('01-04-2021') )

    get "/api/v1/cohorts/#{cohort_2107_be.id}"

    expect(response).to be_successful

    response_body = JSON.parse(response.body, symbolize_names: true)

    expect(response_body).to have_key(:name)
    expect(response_body[:name]).to eq("2107 BE")
    expect(response_body[:start_date]).to eq("2021-07-01")
    expect(response_body[:graduation_date]).to eq("2022-02-01")
  end

  it 'can render an error status if a bad request is made' do 
    cohort_2107_be = Cohort.create(name: "2107 BE", start_date: Date.parse('01-07-2021'), graduation_date: Date.parse('01-02-2022') )
    cohort_2103_fe = Cohort.create(name: "2103 FE", start_date: Date.parse('01-03-2021'), graduation_date: Date.parse('01-10-2021') )
    cohort_2105_be = Cohort.create(name: "2105 BE", start_date: Date.parse('01-05-2021'), graduation_date: Date.parse('01-12-2021') )

    get "/api/v1/cohorts/999999"

    response_body = JSON.parse(response.body)
    expect(response_body).to eq(404)
  end
end