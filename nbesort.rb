#!/usr/bin/env ruby
"""
@Author	:	David Shaw
@Date	:	September 22, 2010
@Name	:	nbesort.rb
@Desc	:	This takes a nessus NBE file and arranges finding into
		a nice and pretty console output. Should be easier to
		create reports this way!
@Usage	:	ruby nbesort.rb <nessus nbe output>
"""

# todo: msf search (msfsearch.rb)

puts """
  ___________ 
 < nbeparse2 >
  ----------- 
        \\   ^__^
         \\  (oo)\\
            (__)\\
"""
if ARGV.size != 1 then
  puts "Usage: ruby nbesort.rb <nessus nbe>"
  exit
end
                                                               
# global finding db
$findings = Hash.new {|h, k| h[k] = Array.new}

filename = ARGV[0]
puts "[-] opening #{filename}"
f = File.open(filename, "r") # user input

f.each_with_index do |line, index|
  # don't do any of this if the line is nil
  if line =~ /^results/ then
    # regex out IP, finding synopsis
    host = line.match(/^results\|[^\|]+\|([^\|]+)/)[1]
    if host
      host = host + ' -- ' + line.scan(/\d+\/tcp/)[0] if line.scan(/\d+\/tcp/)[0]
    end
    if line.include?('Synopsis :') then		
      title = line.scan(/Synopsis :\\n\\n([^\\]+)/)[0] #/
      title.push(line.scan(/Risk factor :\\n\\n([^\\]+)/)[0]) #/
    end
    line.scan(/\d+\/tcp/)[0]

    # add to the database
    $findings[title].push(host) if host and title
    host = nil
    title = nil
  end
end

# are we done? spit out info :D
$findings.each do |key, value|
  print "=> "
  puts key
  value.each do |e|
    puts e
  end
  puts 
end

