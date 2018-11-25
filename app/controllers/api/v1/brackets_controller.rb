module Api
    module V1
        class BracketsController < ApplicationController
            def index
                brackets = Bracket.all;
                render json: {status: 'SUCCESS', message:'Loaded brackets', data: brackets}, status: :ok
            end

            def show
              bracket = Bracket.find(params[:id])
              render json: {status: 'SUCCESS', message: 'Loaded bracket', data: bracket}, status: :ok
            end

            def create
              bracket = Bracket.new(bracket_params)
              if bracket.save
                render json: {status: 'SUCCESS', message: 'Saved bracket', data: bracket}, status: :ok
              else
                render json: {status: 'ERROR', message: 'Bracket not saved', data: bracket.errors}, status: :unprocessable_entity
              end
            end

            def destroy
              bracket = Bracket.find(params[:id])
              bracket.destroy
              render json: {status: 'SUCCESS', message: 'Deleted bracket', data: bracket}, status: :ok
            end

            def update
              bracket = Bracket.find(params[:id])
              if bracket.update_attributes(bracket_params)
                render json: {status: 'SUCCESS', message: 'Updated bracket', data: bracket}, status: :ok
              else
                render json: {status: 'ERROR', message: 'Bracket not saved', data: bracket.errors}, status: :unprocessable_entity
              end
            end
            private

            def bracket_params    
              params.permit(:title)
            end
        end
    end
end
