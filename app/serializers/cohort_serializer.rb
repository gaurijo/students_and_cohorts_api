class CohortSerializer 
  include JSONAPI::Serializer
  attributes :name, :start_date, :graduation_date

  attribute :number_of_students do |object| 
    object.students.count 
  end

  attribute :status do |object|
    if object.graduation_date < Date.today
      'graduated'
    elsif object.graduation_date > Date.today
      'current'
    else 
      'future'
    end
  end
end

#number of students
#status (future, current, graduated) - this should be based off of the start/graduation dates compared to the current date that the request is being made