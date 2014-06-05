# Scrapes FIFA website, extracts team players and inserts them on a database
# Requires gems watir-webdriver, headless and pg
# Also, headless needs xvfb
require 'watir-webdriver'
require 'headless'
require 'pg'

headless = Headless.new
headless.start

player_url_fmt = 'http://www.fifa.com/worldcup/teams/team=%s/players.html';
urls = {
    'USA' => '43921',
    'CHI' => '43925',
    'MEX' => '43911',
    'HON' => '43909',
    'CRC' => '43901',
    'COL' => '43926',
    'ECU' => '43927',
    'BRA' => '43924',
    'URU' => '43930',
    'ARG' => '43922',
    'ENG' => '43942',
    'NED' => '43960',
    'BEL' => '43935',
    'GER' => '43948',
    'FRA' => '43946',
    'SUI' => '43971',
    'CRO' => '43938',
    'BIH' => '44037',
    'ITA' => '43954',
    'ESP' => '43969',
    'POR' => '43963',
    'GRE' => '43949',
    'ALG' => '43843',
    'IRN' => '43817',
    'GHA' => '43860',
    'NGA' => '43876',
    'CIV' => '43854',
    'CMR' => '43849',
    'JPN' => '43819',
    'KOR' => '43822',
    'AUS' => '43976',
    'RUS' => '43965'
}

div_cls = 'p-n'

pl_cls = 'p-n-webname'
pl_fieldpos = 'p-i-fieldpos'
pl_club = 'p-i-clubname'

conn = PGconn.open(
    :hostaddr => '127.0.0.1',
    :port => 5432,
    :dbname => 'smb2014',
    :user => 'scraper',
    :password => 'scraper123'
)
conn.prepare('insert', "insert into players(team_id, name, field_position_id, club) values ((select id from team where code=$1), $2, (select id from field_position where name = $3), $4);")

urls.each do |code, url_number|
    b = Watir::Browser.new 'ff'
    url = sprintf player_url_fmt % [url_number]
    b.goto url
    b.divs(:class => div_cls).map do |div|
        name = div.span(:class => pl_cls)
        pos  = div.span(:class => pl_fieldpos)
        team = div.span(:class => pl_club)
        printf "country: %s, name: %s, field position: %s, team: %s\n", code, name.text, pos.text, team.text
        conn.exec_prepared(
            'insert',
            [code, name.text, pos.text, team.text]
        )
    end
    b.close
end
conn.close
headless.destroy
