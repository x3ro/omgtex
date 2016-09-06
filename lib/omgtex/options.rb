require 'optparse'

module Omgtex
  class Options

    def self.parse!
      options = {:latexOptions => [ ]}

      options[:typesetter] = "pdflatex"

      optparse = OptionParser.new do|opts|
        opts.banner = "Usage: omgtex [options] file.tex"

        options[:openpdf] = false
        opts.on('-o', '--open', 'Open PDF file after rendering') do
          options[:openpdf] = true
        end

        options[:bibtex] = false
        opts.on('-b', '--bibtex', 'Run BibTeX as well') do
          options[:bibtex] = true
        end

        options[:glossary] = false
        opts.on('-g', '--glossary', 'Generate glossary file') do
          options[:glossary] = true
        end

        opts.on('-e', '--shell-escape', 'Shell escape-ish') do
          options[:latexOptions].push("-shell-escape")
        end

        opts.on('-x', '--xelatex', 'Use XeLaTeX instead of pdflatex') do
          options[:typesetter] = "xelatex"
        end

        opts.on('-t TYPESETTER', '--typesetter', 'Use this executable for typesetting LaTeX') do |l|
          options[:typesetter] = l
        end

        opts.on('-h', '--help', 'Display this message') do
          puts opts
          exit
        end

        opts.on('-l COMMAND', '--latex', 'Command to be passed to LateX command') do |l|
          options[:latexOptions].push(l)
        end

      end
      optparse.parse!
      options

    end
  end
end
