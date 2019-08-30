class ExecuteCode
  require "open3"
  attr_accessor :code_lines, :challenge_id 

  def initialize(code_lines = [], challenge_id = 0)
    @code_lines = code_lines
    @challenge_id  = challenge_id
  end

  def execute_test
    binding.pry
    challenge = Challenge.find(self.challenge_id)
    test_options = []
    challenge.tests.each do |test|
      test_pair = []
      test_pair << test.input 
      test_pair << test.expect
      test_options << test_pair
    end
   
    test_options
    code_lines = self.code_lines

    # ランダムファイル名生成と書き込み
    file_name = write_into_file(code_lines)
    
    # コードを実行
    result_flag = false
    output = ""
    error = ""
    test_options.each do |option|
      binding.pry
      o, e = Open3.capture3("ruby code/#{file_name}.rb", :stdin_data=>"#{option[0]}")
      output = o
      error = e 
      binding.pry
      if output.to_s[0..-2] == option[1] && error.empty?
        result_flag = true
      else
        result_flag = false
      end 
    end
    # binding.pry
    # 実行後は削除
    Open3.capture3("rm code/#{file_name}.rb")
    return output.to_s, result_flag
  end

  def execute_confirmation
  end

  private
  
  def write_into_file(code_lines = [])
    random = []
    15.times do
      random << ('a'..'z').to_a[rand(26)]
    end
    random_num = random.join("")
    
    open("code/#{random_num}.rb", 'w'){|f|
      code_lines.each do |line|
        f.puts line 
      end
    }
    random_num
  end

end