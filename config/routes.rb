Rails.application.routes.draw do
  root to:"main#index"

  #To edit Passwords
  get "password", to:"passwords#edit", as: :password_edit
  patch "password", to:"passwords#update"

  #To register Student 
  get "register_student",to: "registrations#new_student"
  post "register_student",to: "registrations#create_student"
  
  #To register Teacher
  get "register_teacher",to: "registrations#new_teacher"
  post "register_teacher",to: "registrations#create_teacher"

  # For Student Update 
  get "edit_profile",to: "registrations#edit_student"
  patch "edit_profile",to: "registrations#update_student"

  #sign in Student
  get "sign_in", to: "sessions#new_student" 
  post "sign_in", to:"sessions#create_student"
  
  #sign in Teacher
  get "teacher_sign_in", to: "sessions#new_teacher" 
  post "teacher_sign_in", to:"sessions#create_teacher"

  #logout for student
  delete "logout_student", to:"sessions#destroy_student"

  #logout for student
  delete "logout_teacher", to:"sessions#destroy_teacher"

  # Add cource Support only by Root User
  get "add_cource", to:"cources#new"
  post "add_cource", to:"cources#create"

  # Enrollment 
  get "enroll", to:"enrollments#new"
  post "enroll", to:"enrollments#create"

  get "show_cources", to:"cources#show"

  #show students of a specific teacher
  get "show_students", to:"teachers#students"

  #root teacher stuff
  get "show_all_students",to:"teachers#allstudents"

  # remove student by root
  delete "destroy_student/:id", to:"teachers#destroy" , as: :destroy_student
end
