require 'swagger_helper'

describe 'Permissions API' do

  path '/permissions' do
    post 'Create a permission' do
        tags 'Permission'
        consumes 'application/json'
        produces 'application/json'
        parameter name: :data, in: :body, schema: {
            type: :object,
            properties: {
                details:{
                    type: :object,
                    properties: {
                        role_id: {type: :integer},
                        action_id: {type: :integer},
                        resource_id: {type: :integer}
                    }
                }
            },
            required: [ 'role_id', 'action_id', 'resource_id' ]
        }
        response '200', 'permission created' do
            examples 'application/json' => {
            success: 'true',
            message: 'permission created'
            }
            let(:details) { { role_id: 3, action_id: 1 , resource_id: 3 } }
            run_test!
        end
    end
  end

  path '/permissions/all_resources?id= ' do

    get 'Given a permission find its resources along with permissions ' do
        tags 'Permission'
        produces 'application/json'
        parameter name: :role_id, :in => :query, :type => :number, :description => 'role id'
        response '200', 'Permissions' do
            examples 'application/json' => {
                success: 'true',
                data: [
                    'Location',
                    'Timings',
                    'dashboard'
                ]
            }
            let(:id) {3}
            run_test!
        end
    end
  end


  path '/permissions?id= ' do
    delete 'Deletes a Permission with provided user_id ' do
        tags 'Permission'
        produces 'application/json'
        parameter name: :id, :in => :query, :type => :number, :description => 'permission id'
        response '200', 'Resources' do
            examples 'application/json' => {
                success: 'true',
                message: 'successfully deleted'
            }
            let(:id) {3}
            run_test!
        end
    end
  end



end
