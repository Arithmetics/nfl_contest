# NFL Playoff Challenge

Application I built to host a competition to pick NBA Over/Under win totals and follow standings over the course of the season.

Live website running at: https://bt-nfl.herokuapp.com/ (Account will need to be created to login).

Technologies used:
* Ruby on Rails 5
* Devise Gem 
* Bootstrap 3
* Image Upload with AWS
* JQuery
* AJAX Remote Forms
* Heroku

### Features:

### Full Feature User Profiles:
![User Profile](https://i.imgur.com/WU195Np.png)
User profiles are supported by the Devise gem.
Custom Profile image upload facilitated with AWS.

### Admin Panel:
![Admin Profile](https://i.imgur.com/B9NgSpN.png)
Admin can see all data in the app and update it within the browser.

### Live Leaderboard:
![Leaderboard](https://i.imgur.com/NbvSiwt.png)
Leaderboard updates as game winners are entered.

###  Remote Form, Custom Styled, Responsive SCSS
![Form](https://i.imgur.com/rfTtO3B.png)
Multioption forms with JQuery provide enhanced user experience. 


## Local Installation:

1. Clone github branch:
> git clone git@github.com:Arithmetics/nfl_contest.git

2. Install:
> bundle install

3. Update seeds.rb file (if neccessary)
> rails db:migrate
(optional)
> rails db:seed

4. Run tests
> rails t

## Comments:

This was the second app I built. It was in the same vein as the NBA Contest Application but with a much better understanding of the Rails system and philosophy. I have very good backend test coverage, the rendering tests could use some work.


### Future Improvements/Retrospective:

1. Add more Javascript to create an event more modern experience.
2. Get rid of Bootstrap and switch to a fully customized SCSS style. 
3. Better use of view partials (again).
4. DB queries are very inefficient. Refactor all DB code a definite priotity if user base were to expand.
