# nbesort.rb -- An Easy Way to Sort Nessus Results by Finding

No self respecting security engineer will tell you that they rely on automated
vulnerability scanners to do the bulk of their analysis. Juicy findings that
demonstrate the severity of the threat they represent usually come from
thorough manual analysis. As a security engineer, it is this manual analyis of
software that I live for, and it is by far my favorite part of testing.
However, this is not to say that vulnerability scanners do not play an
important role: without Tenable's Nessus (our vulnerability scanner of
choice), I would be overwhelmed with the sheer volume of low level findings
that I'd have to deal with before being free to "dive deep" into the
assessment. Things like outdated software versions and known configuration
issues make a lot of sense to be tested by an automated scanner then
subsequently validated and interpreted by a trained engineer.

The problem with this approach lies in the fact that there are a lot of
findings that Nessus generates, including many that are not useful for my
scope of assessment. I know I'm not alone in being less than thrilled with
the Flash-based frontend for Nessus that has been standard for a few
versions now, and exporting the report to HTML is really just as annoying to
deal with. It is for these reasons that I wrote a small script which I am
now very happy to release to you: nbesort.rb.

The data that I need from Nessus is complete list of the issues it's raised,
with affected hosts and ports listed under each finding. In this way, it is easy
for me to discard irrelevant findings and to pinpoint every host in scope
when I see that an issue is valid and important (and hopefully exploitable).
Although this seems like a simple request, the mostly-broken Nessus web
frontend is incapable of providing this information in an easily accessible
way. Don't get me wrong: Nessus is great software. I just don't like the new
way that data is displayed through a Flash frontend.

I am happy to announce that approval to release nbesort.rb to the world was
granted, and the (open source) script is available on GitHub at
https://github.com/davidshaw/nbesort.rb/

Using nbesort.rb to sort Nessus results by finding is very simple. The first
step to using nbesort.rb is to login to the web portal and export your
report as an NBE. This is the standard Nessus output, and the name of the
script should help you remember to export .nbe instead of .nessus.
nbesort.rb is a
Ruby (command line) script, executed by running `ruby nbesort.rb <your_nbe
file>`. The resulting text will output to stdout, so if you want to save to
a file you just have to add >outfile.txt to the end.

I hope that nbesort.rb saves you a few minutes the next time you have to
parse through a big Nessus output. Remember: every minute you save on the
low-hanging fruit is another minute you get to spend banging away on the
critical issues you're so close to cracking. Happy scanning!
