Rails.application.routes.draw do
  root to:"main#index"

  get "password", to:"passwords#edit", as: :password_edit
  patch "password", to:"passwords#update"

  #To register Student 
  get "register",to: "registrations#new"
  post "register",to: "registrations#create"
  
  #To register Teacher
  get "register_teacher",to: "teacher_registrations#new"
  post "register_teacher",to: "teacher_registrations#create"

  get "edit_profile",to: "registrations#edit"
  patch "edit_profile",to: "registrations#update"

  get "show_student", to: "registrations#show"

  #sign in Student
  get "sign_in", to: "sessions#new" 
  post "sign_in", to:"sessions#create"
  #sign in Teacher
  get "teacher_sign_in", to: "teacher_sessions#new" 
  post "teacher_sign_in", to:"teacher_sessions#create"

  #logout for student
  delete "logout", to:"sessions#destroy"

  #logout for student
  delete "logout_teacher", to:"teacher_sessions#destroy"

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
