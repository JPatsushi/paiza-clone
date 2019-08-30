class ChallengesController < ApplicationController

  def index
    @challenges = Challenge.all
  end

  def show
    @challenge = Challenge.find(params[:id])
    gon.challenge_id = @challenge.id
  end

  def execute
    # binding.pry
    code_lines = params["content"]
    challenge_id = params["challenge_id"]
    service = ExecuteCode.new(code_lines, challenge_id)
    @result, @result_flag = service.execute_test 
    # ["3\n,false"]
    # binding.pry
  end

end
