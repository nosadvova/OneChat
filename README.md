# OneChat

## Demo

<img src = "https://user-images.githubusercontent.com/96892718/207380156-4b9e42b5-9c3e-45e5-8557-d0f44f4e8297.png" height="650rm">  <img src ="https://user-images.githubusercontent.com/96892718/207380204-4d88c5fa-9aa3-4ba2-ab6a-3a985bcf11b7.png" height="650rm">  <img src ="https://user-images.githubusercontent.com/96892718/207380338-c5b43f43-ac03-4e61-a5df-bfab4d190892.png" height="650rm"> <img src = "https://user-images.githubusercontent.com/96892718/207380361-e048caf8-2388-4d8e-9738-22c88a5bb99c.png" height = "650rm">


## Built With

* [UIKit] - To build user interfaces across all Apple platforms.
* [FireBase] - As a third-party library to manage user profiles and data.


## Pods to install

```
platform :ios, '16.0'

target 'OneChat' do
  #Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  #Pods for OneChat

  pod 'FirebaseAuth'
  pod 'FirebaseFirestore'
  pod 'IQKeyboardManagerSwift'

end
```

