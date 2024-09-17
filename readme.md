Room Hosting Management System

Overview

The Room Hosting Management System is built using microservice architecture to enable high scalability and flexibility. The platform allows users to book rooms and hosts to manage their room listings, with separate services handling user management, booking, payments, reports, and rooms.

This architecture ensures modularity, making it easier to scale and maintain the system as demand grows.

Architecture

The system is divided into several microservices, each responsible for a specific functionality:

Microservice           Technology   Port
---------------------- ------------ -----
Booking                Spring Boot   8081
Payment                Spring Boot   8082
Customer/User          Spring Boot   8083
Host                   Node.js       8084
Report                 Node.js       8085
Rooms                  Node.js       8086

The Spring Boot microservices are chosen for secure handling of sensitive data (e.g., customer and payment details) due to their robust security features (e.g., Spring Security’s 12 layers of protection). The Node.js microservices are utilized for faster, scalable data operations related to hosts, rooms, and reports.

Features

- User Authentication & Authorization: Users can sign up, securely hash their passwords, and sign in to their accounts.
- Host Management: Users can register as hosts and manage room listings with details like amenities, location, and tariff.
- Room Booking: Users can book available rooms for a given duration and initiate payments.
- Payment Processing: Handles payments for room bookings, including tracking the payment method and amount paid.
- Report System: Users can report rooms and hosts, with details logged for future reference.

Services and Entities

Customer/User Service (Spring Boot - 8081)
This service manages all user-related functionalities, including sign-up, login, user profiles, and host status. It also handles password security and user bookings.

Data Model:
- userId (Primary Key, Auto-generated)
- username
- email
- password
- description
- customerRating
- bookings (Past and present)
- wishlist (Array of room IDs)
- reports (User-submitted reports)
- isHost (Boolean)

Booking Service (Spring Boot - 8082)
Handles the room booking process, including tracking which users have booked which rooms for a given duration and the total tariff for the stay.

Data Model:
- bookingId (Primary Key)
- roomId (Foreign Key)
- hostId (Foreign Key)
- customerId (Foreign Key)
- stayDuration
- tariff

Payment Service (Spring Boot - 8083)
Manages payment processing for room bookings, including payment mode and amount.

Data Model:
- bookingId (Foreign Key)
- paymentMode
- paidAmount

Host Service (Node.js - 8084)
Hosts are users who manage room listings. This service handles creating and managing hosted rooms and providing room details for potential customers.

Data Model:
- hostId (Primary Key)
- userId (Foreign Key to Customer/User)
- hostedRooms (Array of room IDs)
- reviews (Array of customer reviews)
- reports (Array of reports against the host)

Room Service (Node.js - 8085)
This service manages the room listings, including room details, availability, reviews, and reports.

Data Model:
- roomId (Primary Key)
- roomDetails
- description
- amenities
- location
- contact
- reviews
- reports
- bookings (Array of bookings for the room)
- datesBooked and datesAvailable
- hostId (Foreign Key)

Report Service (Node.js - 8086)
Allows users to submit reports related to rooms and hosts. This service tracks the report details and logs them for further action.

Data Model:
- reportId (Primary Key)
- roomId (Foreign Key)
- hostId (Foreign Key)
- reportDetails
- reportDate

How to Run

Each microservice is hosted on a separate port and can be started individually. Ensure that the required ports (8081-8086) are free, and follow the steps below to start each service:

1. Spring Boot Services (Customer, Booking, Payment)
   cd [service-name]
   ./mvnw spring-boot:run

2. Node.js Services (Host, Rooms, Report)
   cd [service-name]
   npm install
   npm start

Future Enhancements

- Image Handling: Currently, the site does not support image handling. Future iterations will allow hosts to upload images of rooms and amenities.
- Payment Confirmation: Payments are processed, but the feature to wait until a payment is confirmed has not been implemented yet.
- Host Verification: There is no document verification for hosts yet. Future updates will include an identity verification system for hosts.

Security

All user data is handled securely with Spring Security (12 layers of security). Passwords are hashed securely during registration and verified during login. Sensitive data like payment details are processed in compliance with security standards.

Implementation 

To get the app running you will need docker installed on your system as the entire app is containerised with docker.

Each service is containerised and finally all the services are pushed to the docker hud and this repo contains the single docker compose file which will get the app running with all the services enabled.

command to start the site you will need the database set up to set up the specified and required databases clone the given repo 

https://github.com/kishore-s-n/hotelSite_ms_Db_docker

then run the given command which will spin up a container that sets up all the databases which uses bash scripting to create those databases

docker compose up

then use the docker compose file of this repo to get the site running by the command

docker compose up 

Contact

For any issues, questions, or feature requests, please feel free to contact the project team at [itskishoresn@gmail.com].
