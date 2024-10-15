# Flutter-app

Hi guys! Welcome to my very simple Flutter App, created for beginners. The template behind it is a workflow management app. 
It is still under development but the bare basics are there.

## Notes
Do note that you need to have your own database setup. I'm using XAMPP (I know, not very safe but it's simple).

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



