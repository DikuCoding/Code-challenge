module Api
  module V1
    class ChallengesController < ApplicationController

      before_action :set_challenge, only: %i[show update destroy]

      # GET /api/v1/challenges
      def index
        # show all challenges
        @challenges = Challenge.all
        render json: @challenges
      end

      # POST /api/v1/challenges
      def create
        #Create single challenge
        puts params

        if @challenge.save
          render json: {message: 'Challenge added successfully', data: @challenge}
        else
          render json: {message: 'Failed to add challenge', data: @challenge.errors}
        end
      end

      # GET /api/v1/challenges/:id
      def show
        #show single challenge

        if @challenge
          render json: {message: 'Challenge found', data: @challenge}
        else
          render json: {message: 'Challenge not found', data: @challenge.errors}
        end
      end

      # PATCH/PUTl /api/v1/challenges/:id
      def update
        #update single challenge

        if @challenge.update(challenges_params)
          render json: {message: 'Challenge updated successfully', data: @challenge}
        else
          render json: {message: 'Failed to update challenge', data: @challenge.errors}
        end
      end

      # DELETE /api/v1/challenges/:id
      def destroy
        #delete single challenge

        if @challenge.destroy
          render json: {message: 'Challenge deleted successfully', data: @challenge}
        else
          render json: {message: 'Failed to delete challenge', data: @challenge.errors}
        end
      end

      private

      def set_challenge
        @challenge = Challenge.find(params[:id])
      end

      def challenges_params
        params.require(:challenge).permit(:title, :description, :start_date, :end_date)
      end

    end
  end
end