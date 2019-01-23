require 'swagger_helper'

describe 'Roles API' do

  path '/roles' do
    post 'Create a role' do
        tags 'Roles'
        consumes 'application/json'
        produces 'application/json'
        parameter name: :data, in: :body, schema: {
            type: :object,
            properties: {
                roles:{
                    type: :object,
                    properties: {
                        designation: {type: :string}
                    }
                }
            },
            required: ['designation']
        }
        response '200', 'Roles' do
            examples 'application/json' => {
                success: 'true',
                message: 'Roles created'
            }
            let(:data) { {name: "QA"} }
            run_test!
        end
    end
  end

  path '/roles?id= ' do
    get 'Shows a roles with provided roles_id ' do
        tags 'Roles'
        produces 'application/json'
        parameter name: :id, :in => :query, :type => :number, :description => 'Role id'
        response '200', 'Roles' do
            examples 'application/json' => {
                id: 3,
                designation: 'developer'
            }
            let(:id) {3}
            run_test!
        end
    end
  end

  path '/roles?id= ' do
    delete 'Deletes a Role with provided roles_id ' do
        tags 'Roles'
        produces 'application/json'
        parameter name: :id, :in => :query, :type => :number, :description => 'Role id'
        response '200', 'Roles' do
            examples 'application/json' => {
                success: 'true', 
                message: 'Role deleted'
            }
            let(:id) {2}
            run_test!
        end
    end
  end

end
