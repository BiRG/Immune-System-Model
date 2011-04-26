#!/usr/bin/ruby

printf("Enter a directory to search: ")
dir = gets.strip #"csl_files"
states = Hash.new
kconstants = Hash.new
maxconstants = Hash.new
p50constants = Hash.new
Dir.entries(dir).each{|file|
  if file =~ /\.csl$/
    lines = IO.readlines("#{dir}/#{file}")

    lines.each{|line|
      if line =~ /^\s*!/
        next 
      end
      if line =~ /(.*)=.*integ\(.*,(.*)\)/
        state = $1.strip
        initial_condition = $2.strip
        key = "#{state}, #{initial_condition}"
        if states[key] == nil
          states[key] = Hash.new
        end
        states[key][file] = ""
      end 
    }

    lines.each{|line|
      if line =~ /^\s*!/
        next 
      end
      sf = 0
      kconstant = ""
      while sfn = line.index(/[\( \-\+\*](k[a-zA-Z0-9_]+)/,sf)
        kconstant = $1.strip
        sf = sfn + 1
        if kconstants[kconstant] == nil
          kconstants[kconstant] = Hash.new
        end
        kconstants[kconstant][file] = ""
      end
    }

    lines.each{|line|
      if line =~ /^\s*!/
        next 
      end
      sf = 0
      maxconstant = ""
      while sfn = line.index(/[\( \-\+\*](MAX[a-zA-Z0-9_]+)/,sf)
        maxconstant = $1.strip
        sf = sfn + 1
        if maxconstants[maxconstant] == nil
          maxconstants[maxconstant] = Hash.new
        end
        maxconstants[maxconstant][file] = ""
      end
    }

    lines.each{|line|
      if line =~ /^\s*!/
        next 
      end
      sf = 0
      p50constant = ""
      while sfn = line.index(/[\( \-\+\*](P50[a-zA-Z0-9_]+)/,sf)
        p50constant = $1.strip
        sf = sfn + 1
        if p50constants[p50constant] == nil
          p50constants[p50constant] = Hash.new
        end
        p50constants[p50constant][file] = ""
      end
    }
  end
}
puts "Unique list of states:"
states.keys.sort.each{|state|
  printf("%40s: %s\n",state,states[state].keys.sort.join(','))
}

puts "\nUnique list of k constants:"
kconstants.keys.sort.each{|kconstant|
  printf("%40s: %s\n",kconstant,kconstants[kconstant].keys.sort.join(','))
}

puts "\nUnique list of P50 constants:"
p50constants.keys.sort.each{|p50constant|
  printf("%40s: %s\n",p50constant,p50constants[p50constant].keys.sort.join(','))
}

puts "\nUnique list of MAX constants:"
maxconstants.keys.sort.each{|maxconstant|
  printf("%40s: %s\n",maxconstant,maxconstants[maxconstant].keys.sort.join(','))
}
