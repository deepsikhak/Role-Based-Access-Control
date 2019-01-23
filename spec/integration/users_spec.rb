require 'swagger_helper'

describe 'Users API' do

  path '/users' do
    post 'Create a user' do
        tags 'Users'
        consumes 'application/json'
        produces 'application/json'
        parameter name: :data, in: :body, schema: {
            type: :object,
            properties: {
                user:{
                    type: :object,
                    properties: {
                        name: {type: :string},
                        phone: {type: :string}
                    }
                }
            },
            required: [ 'name', 'phone' ]
        }
        response '200', 'User created' do
            examples 'application/json' => {
            success: 'true',
            message: 'User created'
            }
            let(:user) { { name: 'shalini', phone: '9988771122' } }
            run_test!
        end
    end
  end

  path '/users/all_resources?id= ' do

    get 'Given a user find its resources along with permissions ' do
        tags 'Users'
        produces 'application/json'
        parameter name: :id, :in => :query, :type => :number, :description => 'user id'
        response '200', 'Resources' do
            examples 'application/json' => {
                success: 'true',
                resources: [
                    {
                        "name": "Location",
                        "action": "read"
                    },
                    {
                        "name": "Timings",
                        "action": "read"
                    },
                    {
                        "name": "dashboard",
                        "action": "delete"
                    }
                ]
            }
            let(:id) {10}
            run_test!
        end
    end
  end

  path '/users?id= ' do
    get 'Shows a user with provided user_id ' do
        tags 'Users'
        produces 'application/json'
        parameter name: :id, :in => :query, :type => :number, :description => 'user id'
        response '200', 'Resources' do
            examples 'application/json' => {
                id: 10,
                name: "bhumika",
                phone: "8899774222",
            }
            let(:id) {10}
            run_test!
        end
    end
  end

  path '/users?id= ' do
    put 'Updated a user ' do
        tags 'Users'
        produces 'application/json'
        parameter name: :id, :in => :query, :type => :number, :description => 'user id'
        parameter name: :data, in: :body, schema: {
            type: :object,
            properties: {
                name: {type: :string}
            },
            required: [ 'name' ]
        }
        response '200', 'Resources' do
            examples 'application/json' => {
                success: 'true',
                message: "User name updated"
            }
            let(:id) {10}
            let(:data) { {name: "ABC"} }
            run_test!
        end
    end
  end

  path '/users?id= ' do
    delete 'Deletes a user with provided user_id ' do
        tags 'Users'
        produces 'application/json'
        parameter name: :id, :in => :query, :type => :number, :description => 'user id'
        response '200', 'Resources' do
            examples 'application/json' => {
                success: 'true',
                message: 'User deleted'
            }
            let(:id) {10}
            run_test!
        end
    end
  end



end
