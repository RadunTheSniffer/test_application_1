# Flutter-app

Hi guys! Welcome to my very simple Flutter App, created for beginners. The template behind it is a workflow management app. 
It is still under development but the bare basics are there. 

# Installation

Download the SDK and edit your enviroment variables.
Select new and add the location of the file or "C\path to file\dev\flutter\bin" and place it at the top. 

Once download you can repo or just start a new application and take the .dart file under /lib to your app directory. Don't forget to copy the dependencies in pubspec.yml
If you want to run the app in different devices, installed Android Studio and Visual Studio 2022. Refer to the flutter doctor command and see any installation missing.

Do note that you need to have your own database setup. I'm using XAMPP (I know, not very safe but it's simple). 
Once installed, click to turn on Apache and MySQL in the Control Panel

Here's the sql query to create a table in your database along with some data for querying and a trigger for timestamping announcements.

### SQL Script

```sql
-- Create the staff table
CREATE TABLE staff (
    staff_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    age INT,
    occupation VARCHAR(50)
);

-- Insert sample data into the staff table
INSERT INTO staff (name, age, occupation) VALUES
('John Doe', 28, 'Software Engineer'),
('Jane Smith', 34, 'Data Scientist'),
('Emily Johnson', 22, 'Designer'),
('Michael Brown', 45, 'Manager'),
('Alice Williams', 30, 'Project Manager'),
('Bob Martin', 27, 'QA Engineer'),
('Charlie Davis', 35, 'DevOps Engineer'),
('Diana Clark', 29, 'UX Researcher'),
('Ethan Lewis', 40, 'Product Owner'),
('Fiona Harris', 32, 'Marketing Specialist'),
('George King', 38, 'Business Analyst'),
('Hannah Scott', 26, 'Frontend Developer'),
('Ian Turner', 31, 'Backend Developer'),
('Julia Adams', 28, 'HR Manager'),
('Kevin White', 36, 'IT Support Specialist'),
('Laura Green', 24, 'Content Writer'),
('Michael Young', 42, 'CTO'),
('Nina Brown', 33, 'Graphic Designer'),
('Oscar Hall', 29, 'Data Analyst');


CREATE TABLE announcement (
    announcement_id INT PRIMARY KEY AUTO INCREMENT,
    article VARCHAR(255),
    time_stamp DATETIME
);

CREATE TRIGGER update_timestamp
BEFORE INSERT ON announcement
FOR EACH ROW
SET NEW.time_stamp = NOW();



INSERT INTO announcement (article) VALUES
    ('Welcome to the announcement page');

```



#Backend 
In your XAMPP server, create a script called search_user.php which will be called by the application for queries and fetch_announcements.php for 
fetching announcements from the announcement table

search_user.php
```php
<?php

//Needed to bypass blocks due to policy
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST");
header("Access-Control-Allow-Headers: Content-Type");

$servername = "";         // localhost server name or ip
$username = "";           // username for databse access, check your credentials
$password = "";           // password for username
$dbname = "";             // database name

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if (isset($_GET['username'])) {
    $username = $_GET['username'];
    $sql = "SELECT * FROM staff WHERE name LIKE '%$username%'";    // staff is table name, can be changed up to you
    $result = $conn->query($sql);

    $data = array();
    if ($result->num_rows > 0) {
        while($row = $result->fetch_assoc()) {
            $data[] = $row;
        }
    }
    echo json_encode($data);
}

$conn->close();
?>

```

fetch_announcements.php 
```php
<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST");
header("Access-Control-Allow-Headers: Content-Type");

$servername = "";         // localhost server name or ip
$username = "";           // username for databse access, check your credentials
$password = "";           // password for username
$dbname = "";             // database name

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT * FROM announcement";
$result = $conn->query($sql);

$data = array();
if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        $data[] = $row;
    }
}
echo json_encode($data);

$conn->close();
?>


```


Save it and store in your htdocs. If you do decide to modify the script file name, do check with your NewPage1.dart and your main.dart which will querying.
Edit the link according to the file name and save. Do a Hot Reload or restard the application.

# Closing Notes

Contact me here :
Gmail: ridhuanfirdaus8855@gmail.com
or 
Instagram: radunnnnn

If you want to modify anything please refer to the directory /lib, that's where all the main program is located.
That's all, have fun developing guys !!! :sunglasses:





