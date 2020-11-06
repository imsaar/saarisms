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

case cmd 
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
 `open "http://github.com/avvo/#{repo}"`
when 'j'
  `open https://jira.internetbrands.com/browse/#{param}`
when 'adp'
  `open https://workforcenow.adp.com/`
when 'sh'
  `open http://ship-it.corp.avvo.com/`
when 'ch'
  `open https://changelog.avvo.com/`
when 'pd'
  `open https://avvo.pagerduty.com/incidents`
when 'hb'
  `open https://app.honeybadger.io/`
when 'a'
  `open "https://www.avvo.com/attorneys/#{param}"`
when 'csmr20'
  `open https://docs.google.com/spreadsheets/d/15jqbHcr-t5fomFiHziuUkJC-563T9AnHsL5sFE6OGJw/edit#gid=2121409843`
when 'csmrtt'
  `open https://confluence.internetbrands.com/pages/viewpage.action?spaceKey=AVVO&title=Consumer+Team+Ticket+Template`
when 'csmrrtt'
  `open https://jira.internetbrands.com/secure/CloneIssueDetails!default.jspa?id=1487519`
when 'csmrbug'
  `open https://jira.internetbrands.com/secure/CloneIssueDetails!default.jspa?id=1487527`
when 'csmrfea'
  `open https://jira.internetbrands.com/secure/CloneIssueDetails!default.jspa?id=1486484`
when 'csmrdebt'
  `open https://jira.internetbrands.com/secure/CloneIssueDetails!default.jspa?id=1680748`
else
  `open http://google.com/search?q=#{param}`
end
