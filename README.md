# infinity-app
📅 A day counter app that is simple and elegant. (Swift Playgrounds Version)

## What does it do?

Infinity is designed to be streak/goal tracker and help the user keep track of how long they have progressed. 

It is designed to be easy to use and stay out of the way.

## Features

- Clean and simple goal tracker
- No ads
- No tracking
- All data is stored locally (100% open source)

## screenshots

### iPhone

Note: These are outdated for iPhone, this will change in final release.

<img src="media/1.png" width="30%"> <img src="media/2.png" width="30%"> <img src="media/3.png" width="30%">

### iPad

<img src="media/1-ipad.png" width="80%"> 
<img src="media/2-ipad.png" width="80%"> 

## What is the difference between "infinity" and "infinity-app" repo?

Originally, I was developing the app on the iPad using Swift Playgrounds and it is working nicely however, sometimes I want to simulate the app on different screen sizes but also take advantage of Xcode's advanced features.

I had the plan of having a separate folder for the Xcode project and simply push/merge the changes of the Xcode version there however, this caused issues for me so I decided to keep them separate. 

- Infinity = App developed with Swift Playgrounds IDE (upstream)
- infinity-app = Clone of the Swift Playgrounds app, just using Xcode to develop the app.

Both repositories should be 1:1 when it comes to code parity. Depending on how things go, only one will be the primary repo used for developing the app.