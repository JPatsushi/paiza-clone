class ExecuteCode
  require "open3"
  attr_accessor :code_lines, :challenge_id 

  def initialize(code_lines = [], challenge_id = 0)
    @code_lines = code_lines
    @challenge_id  = challenge_id
  end

  def execute_test
    challenge = Challenge.find_by(self.challenge_id)
    test_options = []
    challenge.tests.each do |test|
      test_pair = []
      test_pair << test.input 
      test_pair << test.expect
      test_options << test_pair
    end
    # binding.pry
    test_options
    code_lines = self.code_lines

    # ランダムファイル名生成
    file_name = write_into_file(code_lines)

    # def responds
    o,e = Open3.capture3("ruby code/#{file_name}.rb", :stdin_data=>"20")
    output = o
    error = e
    binding.pry
    # 外部コマンド実行 実行後は削除
    Open3.capture3("rm code/#{file_name}.rb")
    
    binding.pry
    # テストオプションを投入

    # 結果を返す["結果", true/false]



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