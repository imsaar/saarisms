# AppleScript
# on run {input, parameters}
#
#       activate me
#
#       return input
#end run

# Ask for Text
# a = attorney profile | adp = avvo adp | g = github/avvo | j = jira | ch = changelog | hb = honeybadger | pd = pagerduty | sh = shipit | csmr 20 = 20% time doc  | csmr tt = ticket template | csmr rtt | csmr bug | csmr fea | csmr debt

input = STDIN.gets.chomp.strip
cmd, param = input.split

File.open('/var/tmp/cmd.log', 'a') { |f| f.puts "#{Time.now} : cmd called with '#{input}'" }

url = case cmd
when 'g'
 repo = case param
        when 'a'
          'amos'
        when 'p'
          'attorney_profiles'
        when 'c'
          'avvo_common'
        when 's'
          'solicitor'
        else
          param
        end
  "http://github.com/avvo/#{repo}"
when 'j'
  "https://jira.internetbrands.com/browse/#{param}"
when 'adp'
  "https://workforcenow.adp.com/"
when 'sh'
  "http://ship-it.corp.avvo.com/"
when 'ch'
  "https://changelog.avvo.com/"
when 'pd'
  "https://avvo.pagerduty.com/incidents"
when 'hb'
  "https://app.honeybadger.io/"
when 'a'
  "https://www.avvo.com/attorneys/#{param}"
when 'csmr'
  subcmd = case param
           when '20'
             "https://docs.google.com/spreadsheets/d/15jqbHcr-t5fomFiHziuUkJC-563T9AnHsL5sFE6OGJw/edit#gid=2121409843"
           when 'tt'
             "https://confluence.internetbrands.com/pages/viewpage.action?spaceKey=AVVO&title=Consumer+Team+Ticket+Template"
           when 'rtt'
             "https://jira.internetbrands.com/secure/CloneIssueDetails!default.jspa?id=1487519"
           when 'bug'
             "https://jira.internetbrands.com/secure/CloneIssueDetails!default.jspa?id=1487527"
           when 'fea'
             "https://jira.internetbrands.com/secure/CloneIssueDetails!default.jspa?id=1486484"
           when 'debt'
             "https://jira.internetbrands.com/secure/CloneIssueDetails!default.jspa?id=1680748"
           else
             "https://docs.google.com/document/d/1r2EZs4ZU7omBEMVkrp7NyytjKBXoOmj82Cdf1T8xRaE/edit"
           end
else
  "http://google.com/search?q=#{input}"
end

File.open('/var/tmp/cmd.log', 'a') { |f| f.puts "#{Time.now} : opening: #{url}" }

`open "#{url}"`

