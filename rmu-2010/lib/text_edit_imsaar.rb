# Ruby Mendicant University Entrance Exam Solution by Ali Rizvi
# http://github.com/rmu/rmu-entrance-exam-2010

module TextEditor
  class Document
    def initialize
      @contents = ""
      @commands = []
      @reverted = []
    end

    def contents
      @contents = ""
      @commands.each {|command| command.call}
      @contents
    end

    def add_text(text, position=-1)
      command = lambda { @contents.insert(position, text) }
      @commands << command
      @reverted = []
    end

    def remove_text(first=0, last=contents.length)
      command = lambda { @contents.slice!(first...last) }
      @commands << command
      @reverted = []
    end


    def undo
      return if @commands.empty?
      @reverted << @commands.pop
    end

    def redo
      return if @reverted.empty?

      @commands << @reverted.pop
    end

  end
end
