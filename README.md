# Tvářbook -- Pastiche Social Network App (based on Facebook)

![demo gif](https://github.com/Rattlehead90/tvarbook/blob/main/func_demo.gif)

## What is it? 
It is a website that mimicks some of the key features of a social network with the design inspired by **Facebook** (*tvář* means *face* in Czech). This is the result of me finishing [the Odin Project](https://www.theodinproject.com/paths/full-stack-ruby-on-rails/courses/ruby-on-rails) course on Ruby on Rails and learning to implement the knowledge by myself. 

## Can I try it out myself?
Sure! The website is currently hosted on Heroku. I'm writing it post-*herok*alypsis though so not sure how long it's going to be up on there. If the link in the bio is unresonsive, the only option would be to clone the branch locally to the machine with Ruby on Rails 7+ installed and running ```./bin/dev``` in root directory.

![sign in screen](https://github.com/Rattlehead90/tvarbook/blob/main/signin_screen.png)

## What can I do there?
- Create a profile or sign in with an existing Facebook profile 👱
- Write posts using the post prompt ✍
- Search for posts in real time in the navbar search field and see them materialize below 🔎
- Find friends on the platform 🧑‍🤝‍🧑, accept or deny friend requests (also look for new friends in *Find friends* section in the sidemenu).
- Explore and have (a limited amount of) fun! 🤓

## Technologies used
- Authentication and session handling by **Devise** and ...
- **Omniauth** to login with an existing Facebook profile 
- Hosted on **Heroku** 
- Avatars hosted by **Gravatar** (*sorry guys, no Active Storage for this one, heroku db is paid now...*) 
- Styling's done with **Tailwind**
- API keys got through to Heroku using **Figaro** 
- **Postgres** database
- Actively used **Hotwire Stymulus** and **Turbo**

### Might add some technical details later if I get more than 10 stars on this one... 
