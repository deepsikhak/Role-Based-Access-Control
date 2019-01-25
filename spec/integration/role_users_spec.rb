require 'swagger_helper'

describe 'User Roles API' do

  path '/role_users' do
    post 'Create a user role' do
        tags 'User Roles'
        consumes 'application/json'
        produces 'application/json'
        parameter name: :data, in: :body, schema: {
            type: :object,
            properties: {
                details:{
                    type: :object,
                    properties: {
                        user_id: {type: :integer},
                        role_id: {type: :integer}
                    }
                }
            },
            required: [ 'user_id', 'role_id' ]
        }
        response '200', 'User created' do
            examples 'application/json' => {
            success: 'true',
            message: 'successfully created'
            }
            let(:details) { { user_id: 2, role_id: 3 } }
            run_test!
        end
    end
  end

  path '/role_users/all_users?role_id= ' do

    get 'Given a user find its roles ' do
        tags 'User Roles'
        produces 'application/json'
        parameter name: :role_id, :in => :query, :type => :number, :description => 'role id'
        response '200', 'UserRoles' do
            examples 'application/json' => {
                data: [
                    'ABC',
                    'himess',
                    'shailla'
                ]
            }
            let(:role_id) {3}
            run_test!
        end
    end
  end

  path '/role_users/all_roles?user_id= ' do
    get 'Shows all users with provided role_id ' do
        tags 'User Roles'
        produces 'application/json'
        parameter name: :user_id, :in => :query, :type => :number, :description => 'user id'
        response '200', 'UserRoles' do
            examples 'application/json' => {
                data: [
                    'developer'
                ]
            }
            let(:user_id) {7}
            run_test!
        end
    end
  end

  path '/role_users?id= ' do
    delete 'Deletes a role with provided role_id ' do
        tags 'User Roles'
        produces 'application/json'
        parameter name: :id, :in => :query, :type => :number, :description => 'role id'
        response '200', 'Roles' do
            examples 'application/json' => {
                success: 'true',
                message: 'Successfully deleted'
            }
            let(:id) {3}
            run_test!
        end
    end
  end



end
