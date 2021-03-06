module Omgtex
  class Runner

    def self.run!
      options = Options.parse!

      abort("A single input file must be specified") if ARGV.length != 1
      file = ARGV.shift

      abort("No .tex file was specified") if ( file =~ /(.*?)(\.tex)/ ).nil?
      filename = $1
      filetype = $2

      latexCommand = "#{options[:typesetter]} #{options[:latexOptions].join(' ')}"

      file = "'#{file}'"
      pdffile = "'#{filename}.pdf'"
      auxfile = "'#{filename}.aux'"

      current_dir = Dir.pwd

      cmd  = " if [ -e '#{auxfile}' ]; then HASH=$(md5 -q #{auxfile}); fi"
      cmd += " && #{latexCommand} #{file}"
      cmd += " && makeglossaries #{filename}" if options[:glossary]
      cmd += " && if [ \"$HASH\" != \"$(md5 -q #{auxfile})\" ]; then "
      cmd += "        echo ''" # Dummy so that the following &&s dont break
      cmd += "        && bibtex #{filename}" if options[:bibtex]
      cmd += "        && #{latexCommand} #{file}"
      cmd += "        && #{latexCommand} #{file} ;"
      cmd += "    fi"
      cmd += " && open #{pdffile}" if options[:openpdf]
      cmd += " && rm -f *.aux *.glo *.ist *.log *.out" unless options[:dontclean]

      if options[:dryrun]
        puts cmd
      else
        Kernel.exec(cmd)
      end
    end

  end
end
