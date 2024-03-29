<!-- PROJECT LOGO -->
<div align="center">
  <a href="https://github.com/jiami-jongejan/ios-amsterdam-hotspot-guides">
    <img src="https://github.com/jiami-jongejan/ios-amsterdam-hotspot-guide/blob/main/project_header_demo.png?raw=true" alt="Logo" width="100%" height="auto">
  </a>

<h3 align="center">Amsterdam's local guide iOS application</h3>
  </p>
</div>


<!-- ABOUT THE PROJECT -->
## About The Project
<div align="center">
Note: I am currently actively working on this application, it is under maintenance. Many features are currently not implemented yet and the text below gives an indication about the current roadmap of development.
</div>
<br/>
A Swift application written from scratch. I created this project to improve my skills on mobile development, Swift and implementing a frontend and backend together. This application shows my favourite Amsterdam hotspots (restaurants, bars etc.) in one app. The backend is created with a RESTful API and the data is retrieved in the Swift application.
<br/>
Latest version

<div align="center">
    <img src="https://github.com/jiami-jongejan/ios-amsterdam-hotspot-guide/blob/main/demo_v1.gif" alt="Logo" width="30%" height="auto">
  </a>
 </div>


<!-- GETTING STARTED -->
## Getting Started
The backend database is currently in Azure Cosmos DB with images stored in Azure Blob Storage. You can find the api on [Postman](https://www.postman.com/cloudy-shuttle-469413/workspace/localguide/collection/11424816-580f89dc-9bd9-40c2-8319-d44eaef01f56?action=share&creator=11424816) I documented the CRUD operations with examples. The Postman `GET - Get all places` ([here](https://www.postman.com/cloudy-shuttle-469413/workspace/localguide/example/11424816-78bf1180-45ad-42bf-9685-dbe350dcf992)), includes an example showing all the JSON data. You can also find the get all [here](https://hotspot-backend.azurewebsites.net/getAll).

<!-- ROADMAP -->
## Features and to do's
- [x] Database in cloud using Azure Cosmos DB
- [x] Images stored in Azure Blob Storage
- [x] Implement backend API calls in Swift
- [x] Retrieve the API calls
- [x] Create UI in Figma 
- [x] Create feed view 
- [x] Create map view
- [ ] Create filtered view
- [ ] Create post place functionality
- [ ] Store favourites using CoreData
- [ ] Implement google login
- [ ] Finished UI implementation
- [ ] Create user login

<!-- LICENSE -->
## License

Distributed under the MIT License
