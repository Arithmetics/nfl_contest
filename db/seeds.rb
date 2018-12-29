# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create!(username: "BrockTillotson",
  full_name: "Brock Tillotson",
  email: "brock.m.tillotson@gmail.com",
  password: "password",
  password_confirmation: "password",
  admin: true,
  lock_points: 5,
  championships: 10)

Matchup.create(
  title: "Wildcard Game #1",
  home_team: "Jacksonville Jaguars",
  home_line: -4.5,
  home_detail: "(12-4)",
  home_picture: "https://i.imgur.com/CbV0W0e.jpg",
  away_team: "Kansas City Chiefs",
  away_line: 4.5,
  away_detail: "(9-7)",
  away_picture: "https://i.imgur.com/qXlWUmx.jpg",
  closing_time: 3.weeks.from_now
)

Matchup.create(
  title: "Wildcard Game #2",
  home_team: "Los Angeles Chargers",
  home_line: -3,
  home_detail: "(10-6)",
  home_picture: "https://i.imgur.com/AVL9A0F.jpg",
  away_team: "Baltimore Ravens",
  away_line: 3,
  away_detail: "(10-6)",
  away_picture: "https://i.imgur.com/WNWPVf8.jpg",
  closing_time: 3.weeks.from_now
)

Matchup.create(
  title: "Wildcard Game #3",
  home_team: "New Orleans Saints",
  home_line: -6,
  home_detail: "(12-4)",
  home_picture: "https://i.imgur.com/Mxzu9q9.jpg",
  away_team: "Los Angeles Rams",
  away_line: 6,
  away_detail: "(11-5)",
  away_picture: "https://i.imgur.com/1rKMNwV.jpg",
  closing_time: 3.weeks.from_now
)

Matchup.create(
  title: "Wildcard Game #4",
  home_team: "Seattle Seahawks",
  home_line: 2,
  home_detail: "(11-5)",
  home_picture: "https://i.imgur.com/kvIbSKc.jpg",
  away_team: "Carolina Panthers",
  away_line: -2,
  away_detail: "(12-4)",
  away_picture: "https://i.imgur.com/57SSvHX.jpg",
  closing_time: 3.weeks.from_now
)


History.create(
  year: 2016,
  winner: "David Wendt",
  correct_picks: 10,
  winnings: 240
)

History.create(
  year: 2015,
  winner: "David Wendt",
  correct_picks: 7,
  winnings: 180
)

History.create(
  year: 2014,
  winner: "Houman Mitorabi",
  correct_picks: 8,
  winnings: 100
)

History.create(
  year: 2013,
  winner: "Erik Gunderson",
  correct_picks: 8,
  winnings: 80
)

History.create(
  year: 2012,
  winner: "Erik Gunderson",
  correct_picks: 7,
  winnings: 70
)
