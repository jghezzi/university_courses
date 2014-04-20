require 'sinatra'
require 'sinatra/activerecord'

set :database, "sqlite3:///university.db"

get '/university' do
	erb :"navigation/index"
end

get '/join/index' do
	@courses = Course.all
	erb :"join/index"
end

get '/join/:id/edit' do
	@join_course = Course.find(params[:id])
	erb :"join/edit"
end

put "/join/:id" do
	@join_to_update = Course.find(params[:id])
	@join_to_update.update_attributes(params[:course])
	redirect "/join/index"
end

get '/courses/index' do
	@courses = Course.all
	erb :"courses/index"
end

get '/courses/new' do
	@courses = Course.all
	@professors = Professor.all
	erb :"courses/new"
end

get '/courses/:id/edit' do
	@edit_course = Course.find(params[:id])
	erb :"courses/edit"
end

get '/courses/:id/show' do
	@delete_course = Course.find(params[:id])
	erb :"courses/show"
end

delete '/courses/:id' do
	delete_course = Course.find(params[:id])
	delete_course.delete
	redirect "/courses/index"
end

post "/courses" do
	@new_course = Course.new(params[:courses]) #courses is table name in db
	@new_course.save
	redirect "/courses/index"
end

put "/courses/:id" do
	@course_to_update = Course.find(params[:id])
	@course_to_update.update_attributes(params[:course])
	redirect "/courses/index"
end

get '/professors/index' do
	@professors = Professor.all
	erb :"professors/index"
end

get '/professors/new' do
	erb :"professors/new"
end

post "/professors" do
	@new_professor = Professor.new(params[:professors])
	@new_professor.save
	redirect "/professors/index"
end

get '/professors/:id/edit' do
	@edit_professor = Professor.find(params[:id])
	erb :"professors/edit"
end

put '/professors/:id' do
	@prof_to_update = Professor.find(params[:id])
	@prof_to_update.update_attributes(params[:professor])
	redirect "/professors/index"
end

get '/professors/:id/show' do
	@delete_professor = Professor.find(params[:id])
	erb :"professors/show"
end

delete '/professors/:id' do
	delete_record = Professor.find(params[:id])
	delete_record.delete
	redirect "/professors/index"	
end

get '/subjects/index' do
	@subjects = Subject.all
	erb :"subjects/index"
end

get '/subjects/new' do
	@subjects = Subject.all
	erb :"subjects/new"
end

get '/subjects/:id/edit' do
	@edit_subject = Subject.find(params[:id])
	erb :"subjects/edit"
end

get '/subjects/:id/show' do
	@delete_subject = Subject.find(params[:id])
	erb :"subjects/show"
end

delete '/subjects/:id' do
	delete_subject = Subject.find(params[:id])
	delete_subject.delete
	redirect "/subjects/index"
end

post "/subjects" do
	@new_subject = Subject.new(params[:subjects]) #subjects is table name in db
	@new_subject.save
	redirect "/subjects/index"
end

put "/subjects/:id" do
	@subject_to_update = Subject.find(params[:id])
	@subject_to_update.update_attributes(params[:subject])
	redirect "/subjects/index"
end


class Professor <ActiveRecord::Base
end

class Course <ActiveRecord::Base
end

class Subject <ActiveRecord::Base
end