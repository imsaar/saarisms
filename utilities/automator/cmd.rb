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
when '20'
	`open https://docs.google.com/spreadsheets/d/15jqbHcr-t5fomFiHziuUkJC-563T9AnHsL5sFE6OGJw/edit#gid=2121409843`
else
 ""
end
