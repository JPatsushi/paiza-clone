class ChallengesController < ApplicationController

  def index
    @challenges = Challenge.all
  end

  def show
    @challenge = Challenge.find(params[:id])
    gon.challenge_id = @challenge.id
  end

  def execute
    code_lines = params["content"]
    challenge_id = params["challenge_id"]
    service = ExecuteCode.new(code_lines, challenge_id)
    service.execute_test


  end

end
