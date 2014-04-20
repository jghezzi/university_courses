class CreateUniversity < ActiveRecord::Migration
 def change
  	create_table :professors do |t|
  		t.integer :professor_id
  		t.string :professor_name 
  	end

  	create_table :courses do |c|
  		c.integer :course_id
  		c.string :course_name
  		c.integer :professor_id
  	end

  	create_table :subjects do|s|
  		s.integer :subject_id
  		s.string :description
  		s.integer :course_id
  	end
  end
end
