A fork from [Github repository](https://github.com/sajaldebnath/demo-3-tier-app)

**Application Structure:**

This is going to be a 3-tier application. With database as backend, app server as mid tier and web server as front tier.

**Technology Used:**

I used the following technologies for the application.

Refer to the README page in each of the folder(/app_vm, /db_vm, web_vm) for steps to setup the VMs

1. **Database VM:**

| **Category**         | **Component**                  | **Version**     |
|:---------------------|:------------------------------:|:---------------:|
| **Operating System** | Ubuntu Server                  | 22.04 (lts)     |
| **Access Method**    | REST API                       | -               |
| **Programming Lang.**| Python                         | 3.10.12         |
| **Database**         | MongoDB                        | 8.0.3           |
| **Applications**     | FastAPI                        | 0.115.3         |
|                      | Uvicorn                        | 0.32.0          |
|                      | Gunicorn                       | 23.0.0          |
|                      | Nginx                          | 1.18.0          |
|                      | Pydantic                       | 2.9.2           |
|                      | Motor                          | 2.5.0           |


2. **Application VM:**

| **Category**         | **Component**                  | **Version**     |
|:---------------------|:------------------------------:|:---------------:|
| **Operating System** | Alpine Linux                   | -               |
| **Access Method**    | Web API                        | -               |
| **Programming Lang.**| Python,HTML5+CSS+jQuery        | 3.10.15         |
| **Applications**     | Flask                          | 3.0.3           |
|                      |               | -               |
|                      | Gunicorn                       | 20.1.0          |
|                      | Uvicorn (with CPython)         | 0.32.0          |
|                      | Requests                       | 2.32.3          |


3. **Web VM:**

| **Category**         | **Component**                  | **Version**     |
|:---------------------|:------------------------------:|:---------------:|
| **Operating System** | Alpine Linux                   | -               |
| **Access Method**    | Web API                        | -               |
| **Applications**     | Nginx                          | 1.22.1          |


Provided below are the reasons for choosing the technology components.

**Detailed Structure:**
Provided below are the detailed structure of the components.

![Architecture Diagram](https://raw.githubusercontent.com/wj-tan/demo-3-tier-app/main/architecture.png)


**How to:**

Provided below are the details of the configuration. Since here I am providing all the program files, servers need to be configured as per detail below. I also plan to create a OVA file with everything pre-configured. That would not require the below configurations.

**Database VM:**

- I have included a sample database with 500 entries. The sample data was generated using [Mockaroo.](https://www.mockaroo.com/)
  - Database Name: employees\_DB
  - Collection Name: employees
  - Structure:
    - "\_id": ObjectId
    - "emp\_id": int
    - "first\_name": str
    - "last\_name": str
    - "email": str
    - "ph\_no": str
    - "home\_addr": str
    - "st\_addr": str
    - "gender": str
    - "job\_type": str
  - In the data structure, we will auto-generate `emp_id` field. This field is not modifiable by end users. It is created while adding a new record or deleted at the time of record deletion.
  - The combination or first_name and last_name is unique. Meaning, no two employees can have same first name and last name.
- After installing MongoDB, create a folder where you want to keep all the required files. For example, employee_db.
- Download all the files under DB VM repository and copy it over to employee_db folder. The files under the DB VM repository are listed below:
  - MOCK_DATA.json - contains the mock data
  - app.py - Python file containing the application
  - employee_database.py - Has the details on how to access the database and all the required functions to handle database operations.
  - employee_models.py - This file defines the models for handling the data from the database. This aligns with the database collection schema.
  - employee_routes.py - This file has all the routes for the application.
  - requirements.txt - Has all the components needed to be installed for the application to be working.
    - fastapi - component which creates the REST API endpoints and Swagger UI
    - uvicorn - Uvicorn is an ASGI web server implementation for Python
    - pydantic[email] - Data validation and settings management using Python type annotations
    - motor - Asynchronous python driver for MongoDB
    - gunicorn - The Gunicorn "Green Unicorn" is a Python Web Server Gateway Interface HTTP server
- **Supported CRUD operations:**

```bash
GET /employee: to list all employees
GET /employee/<emp_id>: to get an employee by employee ID
POST /employee: to create a new employee record
PUT /employee/<emp_id>: to update an employee record by employee ID
DELETE /employee/<emp_id>: to delete an employee record by employee ID
```
**Sample Screenshots**

Provided below are few sample screenshots.

**Swagger UI and Redocs**

![Documentation](https://user-images.githubusercontent.com/11576892/226115519-5c1baf4e-f780-4217-932f-37c3aa1058db.gif)

**Application UI**

![App Screenshots](https://user-images.githubusercontent.com/11576892/226115529-2eec25bd-1746-47f1-a7f3-4c92d2f8fb5e.gif)

